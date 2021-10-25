from tkinter import *

root = Tk()

e = Entry(root, width=50)
e.pack()

def myClick():
    name = e.get()
    myLabel = Label(root, text = 'Thx byeeee')
    myLabel.pack()
    print(name)
    root.destroy()

myButton = Button(root, text = 'Enter your name: ', command=myClick)
myButton.pack()

root.mainloop()
