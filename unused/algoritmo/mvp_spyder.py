#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import pandas as pd
import numpy as np

kiridata_ranks_results = pd.read_csv('data/kiridata_ranks.csv', sep=';', decimal=',')
kiridata_users_results = pd.read_csv('data/kiridata_user.csv', sep=';', decimal='.')



def clc_rank_temperatura (temp, temp_media, temp_rank, calor, frio):
    rsp = 0
    if((temp > temp_media) and (calor == 1)):
        rsp = temp_rank
    elif((temp < temp_media) and (frio == 1)):
        rsp = temp_rank
    return rsp


def clc_rank_playa (tgp, dchp, ranking):
    rsp = 0
    if ((tgp == True)and(dchp < 30)):
        rsp = ranking
    return rsp

def clc_rank_mipc (modo, ipc, media, ranking):
    #modo respuesta 0->bajo, 1-> medio, 2->alto;
    rsp = 0
    if((ipc > (media*1.03)) and (modo==2)):
        rsp = ranking
    elif((ipc < (media*0.97)) and (modo==0)):
        rsp = ranking
    elif((ipc < (media*1.03)) and (ipc > (media*0.97)) and modo== 1):
        rsp = ranking
    return rsp

def clc_rank_multioptions (entrada, ranking):
    if (entrada == True):
        rsp = ranking
    return rsp


def resultado_ciudad(kiridata_ranks_results_in, kiridata_users_results_in, handler):
    
    resultado_city =0
    resultado_city = clc_rank_temperatura(kiridata_ranks_results['temperatura'][handler], kiridata_ranks_results['temperatura'].mean(), kiridata_ranks_results['temperatura_rank'][handler], kiridata_users_results['te_gusta_calor'], kiridata_users_results['te_gusta_frio'])
    resultado_city += clc_rank_playa(kiridata_users_results['te_gusta_playa'], kiridata_ranks_results['km_centro_playa'][handler],kiridata_ranks_results['distancia_playa_rank'][handler])
    resultado_city += clc_rank_mipc(kiridata_users_results['preferencia_costevida'],kiridata_ranks_results['indice_ipc'][handler], kiridata_ranks_results['indice_ipc'].mean(), kiridata_ranks_results['ipc_rank'][handler])
    resultado_city += clc_rank_multioptions(kiridata_users_results['seguro_salud'][handler], kiridata_ranks_results['prof_ap_rank'][handler])
    resultado_city += clc_rank_multioptions(kiridata_users_results['actividad_aire_libre'][handler], kiridata_ranks_results['zonas_verdes_rank'][handler])
    resultado_city += clc_rank_multioptions(kiridata_users_results['importancia_seguridad'][handler], kiridata_ranks_results['criminalidad_rank'][handler])
    
    return resultado_city
    

def mejor_ciudad(kiridata_ranks_results_in, kiridata_users_results_in):
    resultado_prev = 0;
    ultima_ciudad = 0;
    for handler in range(6):
        if(kiridata_ranks_results_in['cuantia_media_arrendamiento'][handler] > kiridata_users_results_in['disponible_alquiler']): #sino dispone almenos para el alquiler la media de la ciudad se descarta la ciudad.
        resultado = resultado_ciudad(kiridata_ranks_results_in, kiridata_users_results_in, handler)
        if(resultado > resultado_prev):
            ultima_ciudad = handler
            resultado_prev = resultado
        
    return(kiridata_ranks_results['ciudad'][ultima_ciudad])

print(mejor_ciudad(kiridata_ranks_results, kiridata_users_results))


