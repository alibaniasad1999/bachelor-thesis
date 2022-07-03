# Bachelor Thesis
## LQIDG Controler for 3DOF Quadcopter Stand ![MATLABver](https://img.shields.io/badge/MATLAB-v9.1%2B-orange.svg) ![MATLAB2020a](https://img.shields.io/badge/MATLAB-R2020a-green.svg) ![xelatex2020](https://img.shields.io/badge/xelatex-2020-blue.svg)
## Abstrcat
In this research, a method based on game theory has been used. In this method, two main players, system and disturbance, are considered. Each of the two players tries to increase their score with the lowest cost, which is considered here, the status of the players' score. In this method, the selection of the move is done using the Nash2 equilibrium, whose purpose is to reduce the cost function assuming the worst move of the other player. This method is resistant to input disturbance. It also has good resistance to modeling uncertainty. The presented method has been used to control a quadcopter three degree of freedom stand, which is also a kind of inverted pendulum. To evaluate the performance of this method, first simulations have been performed in the Simulink environment and then, by implementing it, the correctness of its performance has been confirmed.
<!-- ![This is an image](https://user-images.githubusercontent.com/37424536/177047530-034dd479-7912-4439-bbe6-32a2f6122b37.png) -->
Keywords: quadcopter, differential game, game theory, Nash equilibrium, three degree of freedom stand, model base design, linear quadratic regulator
## Plant
This is three degree of freedom quadcopter stand.
<!-- <p align="center"><img width=43% src="https://user-images.githubusercontent.com/37424536/177047530-034dd479-7912-4439-bbe6-32a2f6122b37.png"></p> -->

## Differential game
In game theory, differential games are a group of problems related to the modeling and analysis of conflict in the context of a dynamical system. More specifically, a state variable or variables evolve over time according to a differential equation.
 ### LQDG controller
 Optimum answer of LQDG come from solving two coupled riccati equation.
 riccati equation mentioned before:
 
$$
\begin{split}
	\boldsymbol{\dot{K}_1}(t) &= -\boldsymbol{A}^\mathrm{T}\boldsymbol{K_1}(t) - \boldsymbol{K_1}(t)\boldsymbol{A} - \boldsymbol{Q_1} +\boldsymbol{K_1}(t)\boldsymbol{S_1}(t)\boldsymbol{K_1}(t) + \boldsymbol{K_1}(t)\boldsymbol{S_2}(t)\boldsymbol{K_2}(t)\\
	\boldsymbol{\dot{K}_2}(t) &= -\boldsymbol{A}^\mathrm{T}\boldsymbol{K_2}(t) - \boldsymbol{K_2}(t)\boldsymbol{A} - \boldsymbol{Q_2} +\boldsymbol{K_2}(t)\boldsymbol{S_2}(t)\boldsymbol{K_2}(t) + \boldsymbol{K_2}(t)\boldsymbol{S_1}(t)\boldsymbol{K_1}(t)
\end{split}
$$

<!-- ![b66f707709628180f909f8860dc8c7bf](https://user-images.githubusercontent.com/37424536/177055174-c8ea4f59-dd90-4571-817e-32b54deb4b52.png) -->


Optimum control command:

$$
	\boldsymbol{u_i}(t) = -\boldsymbol{R_{ii}}^{-1}\boldsymbol{B_i}^\mathrm{T}\boldsymbol{K_{i}}(t)\boldsymbol{x}(t),\quad i = 1, 2
$$

  <!-- <p align="center"><img width="350" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055195-8ba066f7-360e-4e42-9d43-a82454579d88.png"> -->



### LQIDG controller
When there is uncertanity in model it is better to use LQIDG controller.
In this controller, the integral of the difference between the system output and the desired value is added to the state vector.

$$
 	\boldsymbol{x_a} = \begin{bmatrix}
 		\boldsymbol{x_d} - \boldsymbol{x}\\
 		\displaystyle \int (\boldsymbol{y_d} - \boldsymbol{y})
 	\end{bmatrix}
$$

  <!-- <p align="center"><img width="180" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055225-64c1e62f-5504-4f63-8ee7-8427d7d3c6d3.png"> -->



New space state matrix:

$$
	\boldsymbol{A_a} = \begin{bmatrix}
		\boldsymbol{A} &0\\
		\boldsymbol{C} & 0
	\end{bmatrix}
$$



  <!-- <p align="center"><img width="110" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055238-6778f115-3c46-4284-aee8-06c14d543861.png"> -->



$$
	\boldsymbol{B_a} = \begin{bmatrix}
		\boldsymbol{B}\\
		0
	\end{bmatrix}
$$

<!-- ![8a5bd8b6de623050707032e8509fe00a](https://user-images.githubusercontent.com/37424536/177055254-074e0649-f633-4901-a034-b19f6bdf9b5c.png) -->

 <!-- <p align="center"><img width="90" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055254-074e0649-f633-4901-a034-b19f6bdf9b5c.png"> -->


and C matrix is identity matrix.
LQIDG coupled riccati equation:

$$
	\begin{split}
		\boldsymbol{\dot{K}_{a_1}}(t) &= -\boldsymbol{A}^\mathrm{T}\boldsymbol{K_{a_1}}(t) - \boldsymbol{K_{a_1}}(t)\boldsymbol{A} - \boldsymbol{Q_{a_1}} +\boldsymbol{K_{a_1}}(t)\boldsymbol{S_{a_1}}(t)\boldsymbol{K_{a_1}}(t) + \boldsymbol{K_{a_1}}(t)\boldsymbol{S_{a_2}}(t)\boldsymbol{K_{a_2}}(t)\\
		\boldsymbol{\dot{K}_{a_2}}(t) &= -\boldsymbol{A}^\mathrm{T}\boldsymbol{K_{a_2}}(t) - \boldsymbol{K_{a_2}}(t)\boldsymbol{A} - \boldsymbol{Q_{a_2}} +\boldsymbol{K_{a_2}}(t)\boldsymbol{S_{a_2}}(t)\boldsymbol{K_{a_2}}(t) + \boldsymbol{K_{a_2}}(t)\boldsymbol{S_{a_1}}(t)\boldsymbol{K_{a_1}}(t)
	\end{split}
$$

 <!-- <p align="center"><img width="1500" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055264-3b3b5fcc-a4dd-45e3-93de-b438a09cae14.png"> -->
<!-- ![d87aa81d7b8a3f5578ea6528f3110828](https://user-images.githubusercontent.com/37424536/177055264-3b3b5fcc-a4dd-45e3-93de-b438a09cae14.png) -->



LQIDG omptimum control command:

$$
\boldsymbol{u_i}(t) = -\boldsymbol{R_{ii}}^{-1}\boldsymbol{B_{a_i}}^\mathrm{T}\boldsymbol{K_{a_i}}(t)\boldsymbol{x_a}(t),\quad i = 1, 2
$$


<!-- ![a4d4a74a0141e65350cbda507312d7f7](https://user-images.githubusercontent.com/37424536/177055274-31e56ec9-e430-4a45-bd48-c36e40efadf0.png) -->
  <!-- <p align="center"><img width="350" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055274-31e56ec9-e430-4a45-bd48-c36e40efadf0.png"> -->


## model of quadcopter stand
This Article used perivous work to model the quadcopter stand.
Final model is shown below.

$$ \boldsymbol{\dot x} = \boldsymbol f(\boldsymbol x, \boldsymbol{\omega})
$$

<!-- ![b196e9eb979f8f21d09483c35ed7ae44](https://user-images.githubusercontent.com/37424536/177055281-c1bf86c5-4ac1-43e9-9a49-34d0de4b7574.png) -->
  <!-- <p align="center"><img width="100" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055281-c1bf86c5-4ac1-43e9-9a49-34d0de4b7574.png"> -->


$$
\boldsymbol f = \begin{bmatrix}
		%		x_4 + x_5\sin(x_1)\tan(x_2) + x_6\cos(x_1)\tan(x_2)\\
		%		x_5\cos(x_1)- x_6\sin(x_1)\\
		%		(x_5\sin(x_1) + x_6\cos(x_1))\sec(x_2)\\
		%		A_1\cos(x_2)\sin(x_1) + 
		%		A_2x_5x_6 + A_3\left(\omega_2^2-\omega_4^2\right)+
		%		A_4x_5\left(\omega_1-\omega_2+\omega_3-\omega_4\right)- \dfrac{x_4}{\lvert x_4\rvert}A_5+A_6\cos(x_1)\\
		%		B_1\sin(x_2) + 
		%		B_2x_4x_6 + B_3\left(\omega_1^2-\omega_3^2\right)+
		%		B_4x_4\left(\omega_1-\omega_2+\omega_3-\omega_4\right)- \dfrac{x_5}{\lvert x_5\rvert}B_5 + B_6\cos(x_2)\\
		%		C_1x_4x_5 + 
		%		C_2\left(\omega_1^2-\omega_2^2+\omega_3^2-\omega_4^2\right)- \dfrac{x_6}{\lvert x_6\rvert}C_3
		x_4 + x_5\sin(x_1)\tan(x_2) + x_6\cos(x_1)\tan(x_2)\\
		x_5\cos(x_1)- x_6\sin(x_1)\\
		(x_5\sin(x_1) + x_6\cos(x_1))\sec(x_2)\\
		A_1\cos(x_2)\sin(x_1) + 
		A_2x_5x_6 + A_3\sigma_1+
		A_4x_5\sigma_4- \dfrac{x_4}{\lvert x_4\rvert}A_5+A_6\cos(x_1)\\
		B_1\sin(x_2) + 
		B_2x_4x_6 + B_3\sigma_2+
		B_4x_4\sigma_4- \dfrac{x_5}{\lvert x_5\rvert}B_5 + B_6\cos(x_2)\\
		C_1x_4x_5 + 
		C_2\sigma_3- \dfrac{x_6}{\lvert x_6\rvert}C_3
	\end{bmatrix}
$$

<!-- ![6617686d03fa55c7d1220468ab3ac4c2](https://user-images.githubusercontent.com/37424536/177055296-d5356c77-e794-4366-8317-54b446deba93.png) -->
 <!-- <p align="center"><img width="1300" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177055296-d5356c77-e794-4366-8317-54b446deba93.png"> -->



$$
\begin{align*}
	&A_1  = \dfrac{h_{cg}gm_{tot}}{m_{tot}h_{cg}^2+J_{11}}& 
	&A_2  =  \dfrac{2m_{tot}h_{cg}^2+J_{22}-J_{33}}{m_{tot}h_{cg}^2+J_{11}}& 
	&A_3  =  \dfrac{bd_{cg}}{m_{tot}h_{cg}^2+J_{11}}& 	\\
	& A_4  =  \dfrac{J_R}{m_{tot}h_{cg}^2+J_{11}} & 
	& A_5 =  \dfrac{m_1g\mu r_x}{m_{tot}h_{cg}^2 + J_{11}} & 
	& A_6=  \\
	&B_1  =  \dfrac{h_{cg}gm_{tot}}{m_{tot}h_{cg}^2+J_{22}}& 
	&B_2 =  \dfrac{-2m_{tot}h_{cg}^2-J_{11}+J_{33}}{m_{tot}h_{cg}^2+J_{22}}& 
	&B_3  =  \dfrac{bd_{cg}}{m_{tot}h_{cg}^2+J_{22}}& \\
	&B_4 =  \dfrac{-J_R}{m_{tot}h_{cg}^2+J_{22}}& 
	& B_5 =  \dfrac{m_2g\mu r_y}{m_{tot}h_{cg}^2 + J_{22}}& 
	& B_6=&
\end{align*}
$$


$$
\begin{align*}
	C_1 =\dfrac{J_{11}-J_{22}}{J_{33}}\quad
	C_2 =\dfrac{d}{J_{33}}\quad
	C_3 = \dfrac{m_3g\mu r_z}{ J_{33}}
\end{align*}
$$


The parameter used in this model introduced in the article.
 ## Simulation in MATLAB simulink
 In this article used simmulink to simulate the quadcopter stand.
 Simulation in MATLAB simulink is shown below.
  <p align="center"><img width="500" alt="Stand_Model" src="https://user-images.githubusercontent.com/37424536/177053082-635a8796-2a62-443e-8793-926f9a43eb4d.png">

 Solving differtial eqautions using ode45.
 <p align="center"><img width="500" alt="Integrator" src="https://user-images.githubusercontent.com/37424536/177053080-08d47018-dcad-48b3-8843-367c3c2b8f4e.png"></p>
 All 6 chanell of quadcopter are shown in the figure below.
 <p align="center"><img width="500" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053072-ddd34d85-ff92-44be-b623-dfd590661819.png">


## Simulation LQDG and LQIDG in MATLAB simulink for quadcopter

<!-- <p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053906-10043543-7b4d-4ee3-ac61-c17e14789df3.png">
 <p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053851-71be0275-7cd6-424b-ba56-b69b94fe0a41.png">
<p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053905-824123af-e7e3-476a-96cd-f4fcb82dae5c.png"> -->
roll             |  pitch
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/37424536/177053906-10043543-7b4d-4ee3-ac61-c17e14789df3.png)  |  ![](https://user-images.githubusercontent.com/37424536/177053851-71be0275-7cd6-424b-ba56-b69b94fe0a41.png)
yaw
![](https://user-images.githubusercontent.com/37424536/177053905-824123af-e7e3-476a-96cd-f4fcb82dae5c.png)


Motor 1             |  Motor 2
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/37424536/177054364-16d4b1b9-862e-4d42-964a-ba171d085fef.png)  |  ![](https://user-images.githubusercontent.com/37424536/177054367-68e700b5-6e78-4ad0-97f7-68ecd7c5af77.png)
Motor 3             |  Motor 4
![](https://user-images.githubusercontent.com/37424536/177054369-81e79e8a-e704-4595-bbe2-a3de13d64832.png)  |  ![](https://user-images.githubusercontent.com/37424536/177054372-3fb6b099-ba70-4eab-b224-06d1e5d9dfa6.png)

## in real
roll             |  pitch
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/37424536/177053886-b2a01459-61f8-42fe-b19b-a17003adf53c.png)  |  ![](https://user-images.githubusercontent.com/37424536/177053893-44b0d95f-0328-4bb0-b74d-10227e85ab36.png)
yaw
![](https://user-images.githubusercontent.com/37424536/177053905-824123af-e7e3-476a-96cd-f4fcb82dae5c.png)

real

Motor 1             |  Motor 2
:-------------------------:|:-------------------------:
![](https://user-images.githubusercontent.com/37424536/177054344-c924c746-9063-49e4-93c0-031d27ea1480.png)  |  ![](https://user-images.githubusercontent.com/37424536/177054347-25d75f38-2d9a-4d2e-8b65-f79a35c8bf3e.png)
Motor 3             |  Motor 4
![](https://user-images.githubusercontent.com/37424536/177054349-6fe3bf2e-6f5e-4da5-97d0-59ae7cf91fac.png)  |  ![](https://user-images.githubusercontent.com/37424536/177054352-71a75642-0633-4c67-b7df-235341d2ccd7.png)
 <!-- <p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053886-b2a01459-61f8-42fe-b19b-a17003adf53c.png">
<p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053893-44b0d95f-0328-4bb0-b74d-10227e85ab36.png">
<p align="center"><img width="250" alt="All-six" src="https://user-images.githubusercontent.com/37424536/177053905-824123af-e7e3-476a-96cd-f4fcb82dae5c.png"> -->

<!-- ![lqidg_roll_pitch_Omega_1](https://user-images.githubusercontent.com/37424536/177054364-16d4b1b9-862e-4d42-964a-ba171d085fef.png)
![lqidg_roll_pitch_Omega_2](https://user-images.githubusercontent.com/37424536/177054367-68e700b5-6e78-4ad0-97f7-68ecd7c5af77.png)
![lqidg_roll_pitch_Omega_3](https://user-images.githubusercontent.com/37424536/177054369-81e79e8a-e704-4595-bbe2-a3de13d64832.png)
![lqidg_roll_pitch_Omega_4](https://user-images.githubusercontent.com/37424536/177054372-3fb6b099-ba70-4eab-b224-06d1e5d9dfa6.png) -->
<!-- ![lqidg_Omega_1]()
![lqidg_Omega_2]()
![lqidg_Omega_3]()
![lqidg_Omega_4]() -->
	
