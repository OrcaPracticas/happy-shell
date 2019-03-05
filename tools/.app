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
# -i  : Genera la instalacion de la nueva ui.
# 
# USO 
#
# app [modificador] [nombre de la ui] [enviroment]
#
# EJEMPLOS
#
# app telehit (levanta una ui)
# app -i telehit (instala la ui)
# app -r telehit corre la ui
# -------------------------------------------------------- #
app(){
    option_ui=$1
    interface=$2
    case $option_ui in
        -i)
            if [ $interface ]
            then
                uis
                clone televisa-digital/ui-$interface
            else 
                logs -e "Introdusca el nombre de la UI"
            fi
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