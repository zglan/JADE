      current=$PWD
      rm ./*.eps
      rm fit_all
      nline=5

      for ((m = 1; m <= 42; m++ ))
      do

       head -n16 energy_$m > tmp
       tail -n11 tmp       > energy_half_$m
cat << EOF  > plot_gnuplot

set term postscript eps enhanced color "Helvetica" 30
set output "energy.eps"
#set size 3,4.3
plot "energy_half_$m" u :(\$$nline--541.87589293474)*27.2*8065 w l notitle

a=1
f(x) = 0.5 * a * ((x-5)/5)**2 
fit f(x) "energy_half_$m" u :(\$$nline--541.87589293474)*27.2*8065 via a 

plot f(x)

EOF

     gnuplot < plot_gnuplot
     cp energy.eps energy_$m.eps
     cp fit.log fit_$m.log

     grep "a               ="  < fit.log | tail -n1 >> fit_all

      done
