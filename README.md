[![numerical-methods](https://raw.githubusercontent.com/Mostafa-sh/numerical-methods/master/img.png)](https://github.com/Mostafa-sh/numerical-methods)

## numerical-methods
This is a repository for a collection of numerical methods in MATLAB. The main feature of this collection is avoiding for loops as much as possible and using the full capabilities of MATLAB array/matrix manipulation. The codes are general, efficient, and pack all the essential steps of the methods in only a few lines. Visualization, proof of convergence, validation, and comparison of methods are provided for many cases.  

Each method is implemented in a single file with the following arrangement and is ready to execute in MATLAB.
~~~~
%Name of the method
part 1
%Method_________________________________________________________________
part 2
%Illustration___________________________________________________________
part 3
~~~~
Part 1 contains some inputs, part 2 contains the steps of the method, and part 3 contains an illustration of outputs, and in some cases, validation of the results and/or comparison with other methods.

For other projects, you can only use part 2 under "%Method___" and remove any other lines that commented at the end by "%for illustration", " %for validation", or "%for comparison".

*To see the above picture, run [this](4_numerical_differentiation/code_4_5_periodic_grid_differentiation.m).*

The numerical methods in this repository:

1. [Solving systems of linear equations](1_linear_solvers/)\
    [1.1. Gaussian elimination](1_linear_solvers/code_1_1_gauss_elimination.m)\
    [1.2. Doolittle decomposition](1_linear_solvers/code_1_2_doolittle_decomposition.m)\
    [1.3. Crout decomposition](1_linear_solvers/code_1_3_crout_decomposition.m)\
    [1.4. Cholesky decomposition](1_linear_solvers/code_1_4_modified_choleski_decomposition.m)\
    [1.5. Gauss-Jordan elimination](1_linear_solvers/code_1_5_gauss_jordan_elimination.m)\
    [1.6. Jacobi method](1_linear_solvers/code_1_6_jacobi_mehod.m)\
    [1.7. Gauss–Seidel method](1_linear_solvers/code_1_7_gauss_seidel_method.m)\
    [1.8. Conjugate gradient method](1_linear_solvers/code_1_8_conjugate_gradient_method.m )\
    [1.9. Thomas method -- tridiagonal matrix](1_linear_solvers/code_1_9_thomas_method.m)

2. [Solving nonlinear equations](2_nonlinear_solvers/)\
    [2.1. Incremental search method](2_nonlinear_solvers/code_2_01_incremental_search.m)\
    [2.2. Fixed-point method (1 equation)](2_nonlinear_solvers/code_2_02_bisection_method.m)\
    [2.3. Regula falsi method](2_nonlinear_solvers/code_2_03_regula_falsi_method.m)\
    [2.4. Bisection method](2_nonlinear_solvers/code_2_04_fixed_point_method_1eq.m)\
    [2.5. Newton method (1 equation)](2_nonlinear_solvers/code_2_05_newton_method_1eq.m)\
    [2.6. Secant method](2_nonlinear_solvers/code_2_06_secant_method.m)\
    [2.7. Fixed-point method](2_nonlinear_solvers/code_2_07_fixed_point_method.m)\
    [2.8. Newton method](2_nonlinear_solvers/code_2_08_newton_method.m)\
    [2.9. Broyden method](2_nonlinear_solvers/code_2_09_broyden_method.m)\
    [2.10. Pseudo-arclength continuation method](2_nonlinear_solvers/code_2_10_arclength_method.m)\
    [2.11. Graeffe's method --  Polynomial root-finding (real)](2_nonlinear_solvers/code_2_11_graeffe_root_squaring.m)\
    [2.12. Laguerre's method -- Polynomial root-finding (real and complex)](2_nonlinear_solvers/code_2_12_laguerre_method.m)

3. [Interpolation and curve fitting methods](3_interpolation_and_fitting/)\
    [3.1. Lagrange interpolation](3_interpolation_and_fitting/code_3_1_lagrange_interpolation.m)\
    [3.2.a. Forward Newton interpolation](3_interpolation_and_fitting/code_3_2a_forward_newton_interpolaion.m)\
    [3.2.b. Backward Newton integration](3_interpolation_and_fitting/code_3_2b_backward_newton_interpolaion.m)\
    [3.3. Hermite interpolation](3_interpolation_and_fitting/code_3_3_hermite_interpolation.m)\
    [3.4.a. Lagrange based spline (order 1,2,3)](3_interpolation_and_fitting/code_3_4a_lagrange_spline.m)\
    [3.4.b. Spline (order 1,2,3)](3_interpolation_and_fitting/code_3_4b_standard_spline.m)\
    [3.5. Bandlimited interpolation](3_interpolation_and_fitting/code_3_5_band_limited_interpolation.m)\
    [3.6. Interpolation of periodic functions](3_interpolation_and_fitting/code_3_6_periodic_interpolation.m)\
    [3.7.a. Least squares regression (any order)](3_interpolation_and_fitting/code_3_7a_least_square_fitting.m)\
    [3.7.b. Weighted least squares regression (any order)](3_interpolation_and_fitting/code_3_7b_weighted_least_square_fitting.m)

4. [Numerical differentiation](4_numerical_differentiation/)\
    [4.1.a. Finite Difference Method (FDM)](4_numerical_differentiation/code_4_1a_finite_difference.m)\
    [4.1.b. Generalized Finite Difference Method (FDM)](4_numerical_differentiation/code_4_1b_generalized_finite_difference.m)\
    [4.2. Differentiation using interpolation](4_numerical_differentiation/code_4_2_differentiation_using_interpolation.m)\
    [4.3. Generalized Differential Quadrature (GDQ) method](4_numerical_differentiation/code_4_3_generalized_differential_quadrature.m)\
    [4.4. Partial differentiation](4_numerical_differentiation/code_4_4_differentiation_in2D.m)\
    [4.5. Differentiation of periodic functions/data](4_numerical_differentiation/code_4_5_periodic_grid_differentiation.m)\
    [4.6. Differentiation in polar coordinates](4_numerical_differentiation/code_4_6_polar_coordinate_differentiation.m)\
    [4.7. Fractional differentiation](4_numerical_differentiation/code_4_7_fractional_differentiation.m)

5. [Numerical integration](5_numerical_integration/)\
    [5.1. Rectangle rule](5_numerical_integration/code_5_01_rectangle_rules.m)\
    [5.2. Trapezoidal rule](5_numerical_integration/code_5_02_trapezoidal_rule.m)\
    [5.3.a. Simpson's 1/3 rule (uniform grid)](5_numerical_integration/code_5_03a_simpson_1_3_uni.m)\
    [5.3.b. Simpson's 1/3 rule](5_numerical_integration/code_5_03b_simpson_1_3.m)\
    [5.4.a. Simpson's 3/8 rule (uniform grid)](5_numerical_integration/code_5_04a_simpson_3_8_uni.m)\
    [5.4.b. Simpson's 3/8 rule](5_numerical_integration/code_5_04b_simpson_3_8.m)\
    [5.5. Gauss–Legendre quadrature](5_numerical_integration/code_5_05_gauss_legendre.m)\
    [5.6. Gauss–Laguerre quadrature (0 to inf integrals)](5_numerical_integration/code_5_06_gauss_laguerre_0_to_inf.m)\
    [5.7. Gauss-Hermite quadrature  (-inf to inf integrals)](5_numerical_integration/code_5_07_gauss_hermite_inf_to_inf.m)\
    [5.8. Chebyshev–Gauss quadrature ( f(x)/sqrt(1-x^2) )](5_numerical_integration/code_5_08_gauss_chebyshev.m)\
    [5.9. Integration using Taylor series](5_numerical_integration/code_5_09_taylor_integral_quadrature.m)\
    [5.10. Integration in 2D](5_numerical_integration/code_5_10_integration_in2D.m)\
    [5.11. Fredholm integral equations](5_numerical_integration/code_5_11_fredholm_integration.m)\
    [5.12. Volterra integral equations](5_numerical_integration/code_5_12_volterra_integration.m)

6. [Solving Ordinary Differential Equations (ODEs)](6_ordinary_differential_equations/)\
  	[6.1.a. Explicit Euler method](6_ordinary_differential_equations/code_6_1a_euler_explicit.m)\
  	[6.1.b. Implicit Euler method](6_ordinary_differential_equations/code_6_1b_euler_implicit.m)\
  	[6.1.c. Modified explicit Euler method](6_ordinary_differential_equations/code_6_1c_euler_explicit_modified.m)\
  	[6.2. Midpoint method](6_ordinary_differential_equations/code_6_2_midpiont_method.m)\
  	[6.3. 2nd-order Runge-Kutta](6_ordinary_differential_equations/code_6_3_2nd_order_runge_kutta.m)\
  	[6.4. 3rd-order Runge-Kutta](6_ordinary_differential_equations/code_6_4_3rd_order_runge_kutta.m)\
  	[6.5. 4th-order Runge-Kutta](6_ordinary_differential_equations/code_6_5_4th_order_runge_kutta.m)\
  	[6.6. Runge-Kutta Fehlberg/Merson method](6_ordinary_differential_equations/code_6_6_runge_kutta_fehlberg_merson.m)\
  	[6.7. Explicit Adams-Bashforth method](6_ordinary_differential_equations/code_6_7_adams_bashforth.m)\
  	[6.8. Implicit Adams-Bashforth method](6_ordinary_differential_equations/code_6_8_adams_bashforth_implicit.m)\
  	[6.9. Newmark method](6_ordinary_differential_equations/code_6_9_newmark_method.m)
