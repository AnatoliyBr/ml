import numpy as np


'''
2 + theta_1 + 2*theta_2 = 0 -> theta_1 + 2theta_2 = -2 -> theta_2 = -2
2 + -theta_1 = 0 -> theta_1 = 2
'''

theta = np.array([[1, 2], [-1, 0]])
y = np.array([-2, -2])
x = np.linalg.solve(theta, y)

print(f'{x}\n{np.allclose(np.dot(theta, x), y)}')