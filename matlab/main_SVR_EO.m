%-------------------------------------------
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of iterations
% Particles_no = number of particles (search agents)
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% ---------------------------------------------------------
clear all;
clc;

%% Load statistics package for Octave (Add by self-SaadDAHMANI)-----
pkg load statistics;
%% To install statistics package, use :
%pkg install -forge statistics


%%-------------------------------------------------------------
%-------------------------------------------------------------------------
 make; %load LibSVM for Octave
 disp("LibSVM for Octave is loaded.");
 %pkg load statistics
 %-------------------------------------------------------------------------

format short;

 %%---------------Load Data
[xlearn, zlearn, xtest, ztest, labellearn, labeltest] = load_data();

 tic();             % Start time computation

 Run_no=1;          % Number of independent runs

 Particles_no = 30;   % Number of particles
 Max_iteration= 100; % Maximum number of iterations

 Function_name='F25svr'; 

 [lb,ub,dim,fobj]=Get_Functions_details(Function_name);

 [Convergence_curve,Ave,Sd, Best_pos] = EO(Particles_no,Max_iteration,lb,ub,dim,fobj,Run_no, xlearn, zlearn, xtest, ztest, labellearn, labeltest);

 display(['The average objective function is : ', num2str(Ave,7)]);
 display(['The standard deviation is : ', num2str(Sd,7)]);

 display(['-->>> The best solution obtained by EO is : ', num2str(Best_pos)]);
 display(['-->>> The best optimal value of the objective function found by EO is : ', num2str(Ave)]);


 computation_time = toc();
 disp("computation time (in seconds) : "); disp(computation_time);

 save svr_eo_result_BS_1.mat Best_pos;
 save svr_eo_result_BC_1.mat Convergence_curve;


 if strcmp(Function_name, 'F25svr')

    % Plot the Convergence curve
    %subplot(1,2,2);

    %semilogy(Convergence_curve,'Color','r')
    %title('Objective space')
    %xlabel('Iteration');
    %ylabel('Best score obtained so far');

    disp(" ");
    disp("******************< TESING THE BEST SVR params >********************************");

    plot_bestSVR(Best_pos);
    %%
    %plot(Convergence_curve);

    disp('-------------------------------------- END.');
    disp(" ");

 endif

