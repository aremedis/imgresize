from PIL import Image
import numpy

def TokenResize(name):
    OldImg = Image.open(name)
    OldSize = OldImg.size
    preMult = numpy.fromstring(OldImg.tostring(),dtype=numpy.uint8)
    alphaLayer = preMult[3::4] / 255.0
    preMult[::4] *= alphaLayer
    preMult[1::4] *= alphaLayer
    preMult[2::4] *= alphaLayer
    if (OldSize[0] > OldSize[1]):
        NewSize = (OldSize[0],OldSize[0])
    else:
        NewSize = (OldSize[1],OldSize[1])
    
    NewImg = Image.new("RGB", NewSize, preMult.tostring())
#    NewImg = Image.new("RGB", NewSize, "black")
    NewImg.paste(OldImg, (int((NewSize[0]-OldSize[0])/2),
                          int((NewSize[1]-NewSize[1])/2)))

    NewImg.show()
#    NewImg.save('token_'+name)



TokenResize("test.png")


    
