import Swal from 'sweetalert2'

export const alertSucess = (titulo, mensagem) => {
    Swal.fire(
        titulo,
        mensagem,
        'success'
    )
}

export const alertError = (titulo, mensagem) => {
    Swal.fire({
        icon: 'error',
        title: titulo,
        text: mensagem		
    })
}