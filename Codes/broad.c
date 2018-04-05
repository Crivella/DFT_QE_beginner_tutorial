//gcc -o broad.x broad.c -O2 -g -Wall -lm -std=c11
/*///////////////////////////////////////////////////////////////////////////////////////////////////
PARAMETERS:	1- input filename	default: 
		2- broadening(eV)	default:
		3- outname		default: stdout
///////////////////////////////////////////////////////////////////////////////////////////////////*/

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>


int main(int argc,char *argv[])
{
	int size,count=0;
	double sigma;
	char c;
	FILE *pFile;

	if(argc>2)
		sigma=atof(argv[2]);
	else
	{
		printf("ERROR: You must specify a broadening value and filename\nExiting.....\n");
		return -1;
	}
	FILE * out = stdout;
	if( argc>3)
		out = fopen( argv[3], "w");
	
	pFile=fopen(argv[1],"r");
	fseek (pFile, 0, SEEK_END);
	size=ftell(pFile);
	rewind(pFile);

	fprintf( stderr, "#Broadening: %f\n",sigma);

	//Get number of lines
	int lines=0;
	while(ftell(pFile)<size)
	{
		c=fgetc(pFile);
		if(c=='#')
		{
			//printf("Comment found...\n");
			while(1)
			{
				if(fgetc(pFile)=='\n')
					break;
			}
		}
		else
		{
			if( c == '\n')
				lines++;
		}
	}	
	fprintf( stderr, "#N Lines: %d\n",lines);
	rewind(pFile);

	//Get number of columns
	int columns=0;
	int trail=0;
	while(ftell(pFile)<size)
	{
		c=fgetc(pFile);
		if(c=='#')
		{
			//printf("Comment found...\n");
			while(1)
			{
				if(fgetc(pFile)=='\n')
					break;
			}
		}
		else
		{
			//printf("Non comment found...\n");
			int flag_num=0;
			while(c!='\n')
			{
				//printf("char: %c\n",c);
				if(c != ' ' && c != '\t')
				{
					if(flag_num==0)
					{
						flag_num=1;
						columns++;
						trail=0;
					}
				}
				else
				{
					flag_num=0;
					trail++;
				}
				c=fgetc(pFile);
			}
			break;
		}
	}
	fprintf( stderr, "#N Coulumns: %d\n",columns);
	double data[lines][columns];
	for(int n1=0; n1 < lines; n1++)
		for(int n2=0; n2 < columns; n2++)
			data[n1][n2]=0;
	rewind(pFile);

	//Read file into data
	while(ftell(pFile)<size-trail-1)
	{
		c=getc(pFile);
		if(c=='#')
		{
			while(1)
			{
				if(getc(pFile)=='\n')
					break;
			}
		}
		else
		{
			fseek(pFile,-1,SEEK_CUR);
			if(count>=lines)
			{
				printf("ERROR: Max points limit exceeded\nExiting.....\n");
				return -1;
			}
			for(int n=0; n<columns; n++)
				if( fscanf( pFile, "%lf",&data[count][n]) < 1)
					return 1;
			fgetc(pFile);
			/*for(int n=0; n<columns; n++)
				printf("%f  ",data[count][n]);
			printf("%li(%d)\n",ftell(pFile),size-trail-1);*/
			count++;
		}
	}
	
	double new_data[lines][columns];
	double gauss,norm;

	for(int i1=0;i1<lines;i1++)
	{
		norm=0;
		new_data[i1][0]=data[i1][0];
		for(int i3=1;i3<columns;i3++)
			new_data[i1][i3]=0;
		for(int i2=0;i2<lines;i2++)
		{
			gauss=(data[i1][0]-data[i2][0])/sigma;
			gauss=exp(-gauss*gauss/2);
			norm+=gauss;
			for(int i3=1;i3<columns;i3++)
				new_data[i1][i3]+=gauss*data[i2][i3];
		}
		for(int i3=1;i3<columns;i3++)
			new_data[i1][i3]/=norm;
	}

	for(int i1=0;i1<lines;i1++)
	{
		for(int i2=0;i2<columns;i2++)
			fprintf( out, "%f\t",new_data[i1][i2]);
		fprintf( out, "\n");
	}
	
	return 0;
}










