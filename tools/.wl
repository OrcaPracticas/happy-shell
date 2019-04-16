# -------------------------------------------------------- #
# Utilidades para las uis.
#
# @package   OrcaTools.
# @subPacage Tools.
# @category  Shell
# @autor     jorge.mendez.ortega@gmail.com
# -------------------------------------------------------- #

# -------------------------------------------------------- #
# Permite los comandos basicos para whitelabel.
# 
# INFO
#
# -i     : instala el componente de White Label.
# -l     : Brinda un listado de los componentes de WhiteLAbel.
# nombre : Busca el componente y te posiciona en el.
# 
# USO 
#
# label [modificador] [nombre del widget]
#
# EJEMPLOS
#
# label telehit (levanta una ui)
# label -i widget-dummy instala el componente
# label -l listado de componentes
# label widget-dummy accede al compnente
# -------------------------------------------------------- #
label(){
    option=$1
    widget=$2
    case $option in 
        -i)
            if [ $widget ]
            then
                wl
                clone televisa-digital/$widget $widget master
            else 
                logs -e "Introdusca el nombre del componente de White label"
            fi
        ;;
        -l) 
            logs -i "Listado de componentes White label"
            wl
            td
            logs -s "Fin del listado"
        ;;
        *)
            logs -i "Entrando al directorio de ${option}"
            wl
            if [ -d "${option}" ]
            then
                cd $option
                logs -s "Acceso correcto"
            else
               logs -e "Directorio no existente ${option}"
            fi
        ;;
    esac
}