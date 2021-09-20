# Multi-Input BASWASD Neuronet
Implementation of a fast 3-layer feed-forward neuronet model that is trained using a beetle antennae search weights-and-structure-determination algorithm called BASWASD.
The purpose of this package is to model and predict balance of payments, listed shares, trade in goods and daily liquidity conditions.
Considering this problem's approach through neuronet, using the weight direct determination (WDD) method and given a maximum number of hidden-layer neurons, the BASWASD algorithm finds the optimal number of hidden-layer neurons along with the optimal power of the activation function at each hidden-layer neuron that reduces the model's error during the validation procedure.

The main articles used are the followings:
*	T.E. Simos, V.N.Katsikis, S.D.Mourtas, "Multi-Input Bio-inspired Weights and Structure Determination Neuronet with Applications in European Central Bank Publications," (submitted)
*	Y. Zhang, D. Chen, and C. Ye, Deep Neural Networks: WASD Neuronet Models, Algorithms, and Applications. CRC Press, 2019.

Also, the kit includes the following four datasets:
*	BP6: Balance of Payments and International Investment Position (BPM6), taken from https://sdw.ecb.europa.eu/browse.do?node=bbn62
*	SEC: Securities, taken from https://sdw.ecb.europa.eu/browse.do?node=bbn46
*	External Trade, taken from https://sdw.ecb.europa.eu/browse.do?node=bbn67
*	Daily liquidity conditions, taken from https://www.ecb.europa.eu/stats/policy_and_exchange_rates/minimum_reserves/html/index.en.html

# M-files Description
*	Main_MI_BASWASDN.m: the main function
*	problem.m: input data and parameters of the MI-BASWASDN
*	BASWASD.m: function for finding the optimal number of hidden-layer neurons, along with the optimal activation function power at each hidden-layer neuron
*	fitness.m: the objective function that must be minimized by BAS
*	MIHPN_WASD.m: function for finding the optimal number of hidden-layer neurons
*	LSVM.m: function for creating a neural network model based on linear SVM method
*	EGPR.m: function for creating a neural network model based on exponential GPR method
*	Normalization.m: function for normalization
*	Qmatrix.m: function for calculating the matrix Q
*	Qmatrix2.m: function for calculating the matrix Q
*	predictN.m: function for predicting
*	error_pred.m: function for calculating the coefficient of determination (R-squared), mean absolute error (MAE) and root-mean-square error (RMSE) of the predicted prices

# Installation
*	Unzip the file you just downloaded and copy the MI-BASWASDN directory to a location,e.g.,/my-directory/
*	Run Matlab, Go to /my-directory/MI-BASWASDN/ at the command prompt
*	run 'Main_MI_BASWASDN

# Results
After running the 'Main_MI_BASWASDN.m file, the package outputs are the following:
*	The optimal number of hidden-layer neurons.
*	The optimal activation function power of each hidden-layer neuron.
*	The models predictions and statistics on the training and testing samples.
*	The graphic illustration of the testing and predicting performance.

# Environment
The MI-BASWASDN kit has been tested in Matlab 2018b on OS: Windows 10 64-bit.
