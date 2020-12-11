#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Dec  9 18:03:55 2020

@author: franciscodeborjaponz
"""
from tkinter import *
from tkinter.ttk import *

### Leer CSV con los datos


### Algoritmo decision


### Interfaz TKinter 
window = Tk()

window.title("Kiribati app")


def text_edit(text_edit, row_input):
    lbl = Label(window, text=text_edit)

    lbl.grid(column=0, row=row_input)

    txt = Entry(window,width=10)

    txt.grid(column=1, row=row_input+1)
    return txt.get()
    
def combo_box3(window, text_edit, opcion1, opcion2, opcion3, row_input):
    lbl = Label(window, text=text_edit)
    lbl.grid(column=0, row=row_input)
    combo = Combobox(window)
    combo['values']= (opcion1, opcion2, opcion3)
    combo.current(1)
    combo.grid(column=0, row=row_input+1)
    return combo.get()
        
def combo_box2(window, text_edit, opcion1, opcion2, row_input):
    lbl = Label(window, text=text_edit)
    combo = Combobox(window)
    combo['values']= (opcion1, opcion2)
    combo.current(1)
    combo.grid(column=0, row=row_input+1)  
    return combo.get()
        
    
   
value_txt1 = text_edit("Ciudad origen",0)   
value_txt2 = text_edit("¿A que te dedicas?",2)   
value_txt3 = text_edit("¿Cual es tu renta?",4)  
combo_res1 = combo_box3(window, "¿Cantidad destinada alquiler?", "menos de 600€", "entre 601 y 750", "mas de 750€", 6)


window.mainloop()



