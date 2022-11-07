for i in 5 10 20
    do
        cd kpt$i
        ln -s ../tmp tmp
        cd ../
done

for j in 5 10 15
    do
        cd bnd$j
        ln -s ../tmp tmp
        cd ../
done
