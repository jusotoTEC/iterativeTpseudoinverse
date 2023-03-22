# MATLAB Code from Numerical Experiments in Paper *"Convergence analysis of iterative methods for computing the T-pseudoinverse
of complete full-rank third-order tensors based on the T-produc"*

## Author

Pablo Soto-Quiros (https://www.tec.ac.cr/juan-pablo-soto-quiros) - Email: jusoto@tec.ac.cr

Pablo Soto-Quiros is an Associate Professor from the *Instituto Tecnológico de Costa Rica* (https://www.tec.ac.cr/) in Cartago, Costa Rica


## Description

* This repository contains the MATLAB code for numerical experiments presented in the paper "*Convergence analysis of iterative methods for computing the T-pseudoinverse
of complete full-rank third-order tensors based on the T-produc*". 
* This paper has been submitted for publication in a scientific journal. 
* This paper proposes an iterative approach for estimating the T-pseudoinverse of a third-order tensor $\mathcal{A}$. The T-pseudoinverse $\mathcal{A}^\dagger$ is defined as a generalization of the classical pseudoinverse for matrices. In this work, we present an efficient iterative method to estimate $\mathcal{A}^\dagger$ based on an iterative formula derived from Li and Li's work on matrices and the T-product of tensors. This iterative method avoids the tedious task of computing the T-pseudoinverse using singular value decomposition. Firstly, we demonstrate that if $\mathcal{A}$ is an invertible tensor, the proposed iterative method, represented by the sequence $\{\mathcal{X}_k\}_{k=0}^\infty$, converges to the inverse tensor of $\mathcal{A}$, for a suitable initial value. Furthermore, for a complete full-rank tensor $\mathcal{A}$, we propose a novel iterative method based on the sequence $\mathcal{X}_k$, that converges to $\mathcal{A}^\dagger$, given an appropriate initial value. Numerical experiments are presented to demonstrate the accuracy of the proposed method.

<p align="center"><img width="1200" src="https://github.com/jusotoTEC/iterativeTpseudoinverse/blob/main/img/img1.png"></p>
