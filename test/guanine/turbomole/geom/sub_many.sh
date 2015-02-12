



    current=$PWD
    curr=$current

      for ((m = 1; m <= 42; m++ )) 
      do

         for ((n = 1; n <= 21; n++ ))
         do
             
 
             cd ./scan/angle_${m}_${n}
	     
              rm *.log
	      rm *.err
	      rm core*


	      bsub -q simul -n 4 -a openmp -R "span[hosts=1]" -o s1_${m}_${n}.log -e s1_${m}_${n}.err g09 s1_${m}_${n}.com

              cd $curr

        done
      done
