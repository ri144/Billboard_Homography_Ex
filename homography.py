from python import *
def H_from_points(fp,tp):
""" find homography H."""
if fp.shape != tp.shape:
raise RuntimeError, ’number of points do not match’
#create matrix for linear method, 2 rows for each correspondence pair
nbr_correspondences = fp.shape[1]
A = zeros((2*nbr_correspondences,9))
for i in range(nbr_correspondences):
A[2*i] = [-fp[0][i],-fp[1][i],-1,0,0,0,
2
tp[0][i]*fp[0][i],tp[0][i]*fp[1][i],tp[0][i]]
A[2*i+1] = [0,0,0,-fp[0][i],-fp[1][i],-1,
tp[1][i]*fp[0][i],tp[1][i]*fp[1][i],tp[1][i]]
U,S,V = linalg.svd(A)
H = V[8].reshape((3,3))