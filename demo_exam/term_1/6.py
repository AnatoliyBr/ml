import numpy as np


'''psi = -2.992 + 0.240*x_1 + 1.102*x_2'''

vector_norm_coord = np.array([0.240, 1.102])

theta_0 = -2.992
theta_1 = 0.240
theta_2 = 1.102

x_1 = 0
x_2 = 0

P = 1 / (1 + np.exp(-(theta_0 + theta_1 * x_1 + theta_2 * x_2)))
print(round(P, 3))