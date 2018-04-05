! Simple code for extracting E(n,k) data for plotting from output of
! a PWSCF 'bands' calculation. Bands are NOT ordered.
!
! The code reads a file called "bands.dat" and it MUST be formatted in this way:
!    number of bands
!    number of k-points
!    list of k-points and eigenvalues from pwscf output, including blank lines
! 
! For example:
!-------------
! 10
! 2
!
!         k = 0.5000 0.5000 0.5000 (   410 PWs)   bands (ev):
!
!   -3.4442  -0.8425   4.9964   4.9964   7.7700   9.5560   9.5560  13.7979
!   16.8290  16.8290
!
!          k = 0.4375 0.4375 0.4375 (   401 PWs)   bands (ev):
!
!   -3.6536  -0.5337   5.0258   5.0258   7.8019   9.5894   9.5894  13.8497
!   15.9209  15.9209
!-------------
!
 program bands
 implicit none

 integer i,j,nl,nkpt,nppl,dum
 integer ik, ib, nkptfile,nbands, nkz
 parameter(nppl=8,nkz=1)
 real*8, allocatable :: ek(:,:),kpt(:,:),kpos(:),loc(:,:)
 real*8 klen, dummy

       open(unit=10,file="bands.dat",status="old")
       open(unit=13,file="plot.dat")
       read(10,*) nbands
       read(10,*) nkptfile ! 
       write(*,*) "Bands: ",nbands
       write(*,*) "K-points in file: ",nkptfile

       allocate(ek(nbands,nkptfile))
       allocate(kpt(3,nkptfile),kpos(nkptfile))
  
! Read k-points and bands
       if (nbands.lt.nppl) then
          do ik=1,nkptfile
          read(10,*) 
          read(10,50) kpt(:,ik)
          read(10,*) 
          read(10,*) (ek(ib,ik),ib=1,nbands)
          write(11,200) (ek(ib,ik),ib=1,nbands)
          enddo
       else
           
          nl = nbands/nppl
!         write(*,*) "nppl=",nppl
!         write(*,*) "nl=",nl
!         write(*,*) "nl excess=",mod(nbands,nppl)
          do ik=1,nkptfile
            read(10,*) 
            read(10,50) kpt(:,ik)
            read(10,*)
             read(10,*) (ek(ib,ik),ib=1,nppl)
             write(11,200) (ek(ib,ik),ib=1,nppl)
             do j=2,nl
                read(10,*) (ek(ib,ik),ib=(j-1)*nppl+1,j*nppl)
                write(11,200) (ek(ib,ik),ib=(j-1)*nppl+1,j*nppl)
             enddo
             if(mod(nbands,nppl).gt.0) then
               read(10,*) (ek(ib,ik),   ib=nl*nppl+1,nl*nppl+mod(nbands,nppl))
               write(11,200) (ek(ib,ik),ib=nl*nppl+1,nl*nppl+mod(nbands,nppl))
             endif
          enddo

       endif

! Calculate the k path distances
  kpos(1) = 0.0
  write(*,456) "k ",1," = ",kpt(:,ik)," dist=",kpos(ik)
  do ik=2,nkptfile
     kpos(ik) = kpos(ik-1) + klen(kpt(:,ik-1),kpt(:,ik) )
     write(*,456) "k ",ik," = ",kpt(:,ik)," dist=",kpos(ik)
  enddo
456 format(a,i3,a,3f7.4,a,f7.4)

! Write to plottable files

       do ib = 1,nbands
!         For plotting band levels in molecules
          if(nkptfile.eq.1) then
             write(13,105) kpos(ik),ek(ib,ik)
             write(13,105) kpos(ik)+0.8,ek(ib,ik)
          else
!         For plotting band levels in solids
            do ik=1,nkptfile
              write(13,105) kpos(ik),ek(ib,ik)
            enddo
          endif
          write(13,*) 
          write(13,*) 
       enddo
       write(*,*) "Plottable E(n,k) data written to plot.dat"

200    format(2x,8f9.4)
100    format(i5,20f8.3)
 99    format(i5,f8.3)
101    format(20f8.3)
102    format(1000f8.3)
103    format(i5,f8.3)
104    format(i5,1000f8.3)
105    format(f8.3,2f8.3)
110    format(f8.3,f8.3,f8.3)
106    format(f8.3,1000f8.3)
50     format(13x,3f7.4)
       end

       real*8 function klen(k1,k2)
       real*8 k1(3),k2(3),kdum

       klen=sqrt( (k2(1)-k1(1))**2 + (k2(2)-k1(2))**2 + (k2(3)-k1(3))**2 )

       end function klen
