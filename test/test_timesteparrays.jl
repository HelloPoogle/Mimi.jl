using Mimi
using Base.Test

import Mimi:
    Timestep, TimestepVector, TimestepMatrix, next_timestep, hasvalue

a = collect(reshape(1:16,4,4))

#####################
#  Test TimestepVector  #
#####################

x = TimestepVector{Int, 2000, 1}(a[:,3])
t = Timestep{2001, 1, 3000}(1)

@test hasvalue(x, t)
@test !hasvalue(x, Timestep{2000, 1, 2012}(10))
@test x[t] == 10

t2 = Mimi.next_timestep(t)

@test x[t2] == 11
@test indices(x) == (2000:2003,)

t3 = Timestep{2000, 1, 3000}(1)
@test x[t3] == 9

#####################
#  Test TimestepMatrix  #
#####################

y = TimestepMatrix{Int, 2000, 1}(a[:,1:2])

@test hasvalue(y, t, 1)
@test !hasvalue(y, Timestep{2000, 1, 3000}(10), 1)
@test y[t,1] == 2
@test y[t,2] == 6

@test y[t2,1] == 3
@test y[t2,2] == 7

@test y[t3, 1] == 1
@test y[t3, 2] == 5

@test indices(y) == (2000:2003, 1:2)

######################################
#  Test with intervals wider than 1  #
######################################

z = TimestepMatrix{Int, 1850, 10}(a[:,3:4]) # duration of 10
t = Timestep{1800,10,3000}(6)
@test z[t,1] == 9
@test z[t,2] == 13

t2 = next_timestep(t)
@test z[t2,1] == 10
@test z[t2,2] == 14
