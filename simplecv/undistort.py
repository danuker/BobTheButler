
calibs = ['/home/dan/Desktop/apps/Robots/dan-toshiba', '/home/dan/Desktop/apps/Robots/trusthd']
index = 0
c = Camera(index)
c.loadCalibration(calibs[index])
while True:
        c.getImageUndistort().show()
        