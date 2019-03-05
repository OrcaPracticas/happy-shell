# -------------------------------------------------------- #
# Utilidades generales.
#
# @package   hapy-shell.
# @subPacage Tools.
# @autor     jorge.mendez.ortega@gmail.com
# -------------------------------------------------------- #

# -------------------------------------------------------- #
# Permite los comandos basicos para las uis.
# 
# INFO
#
# -i     : Genera la instalacion de la nueva ui.
# nombre : Busca la ui y te posiciona en ella
# -l     : Brinda un listado de la UI
# 
# USO 
#
# app [modificador] [nombre de la ui] [enviroment]
#
# EJEMPLOS
#
# app telehit (levanta una ui)
# app -i telehit (instala la ui)
# app -l listado de UI's
# app telehit accede a la UI
# -------------------------------------------------------- #
app(){
    option_ui=$1
    interface=$2
    enviroment=$3

    if [[ $# -ne 3 ]] 
    then
        enviroment=$CLUSTER_ENVIROMENT
    else
        enviroment=$3
    fi

    case $option_ui in
        -r|-rd)
            uis
            logs -i "🚀 Levantando WebApp ui=$interface, CLUSTER_ENV=$enviroment"
            if [ -d "ui-${interface}" ]
            then
                core
                export NODE_ENV=development
                export CLUSTER_ENV=$enviroment
                export UI=ui-$interface
                
                if [[ $1 =~ "rd" ]] 
                then 
                    logs -m "Levantando la app para debugger"
                    run_debug
                else 
                    yarn init-eslint:ui-$interface
                    run_app
                fi
            else
                logs -e "Introdusca una UI valida"
            fi
        ;;
        -i)
            if [ $interface ]
            then
                uis
                clone televisa-digital/ui-$interface
            else 
                logs -e "Introdusca el nombre de la UI"
            fi
        ;;
        -l) 
            logs -i "Listado de uis instaladas"
            uis
            td
            logs -s "Fin del listado"
        ;;
        *)
            logs -i "Entrando el directorio ui-${option_ui}"
            uis
            if [ -d "ui-${option_ui}" ]
            then
                cd ui-$option_ui
                logs -s "Acceso correcto"
            else
               logs -e "LA ui-${option_ui}"
            fi
        ;;
    esac
}