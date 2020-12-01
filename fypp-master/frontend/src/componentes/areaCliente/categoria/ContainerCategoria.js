import React, { Component } from 'react'
import Navbar from '../Navbar'
import Swal from 'sweetalert2'
import CardCategoria from './CardCategoria'

class Categoria extends Component {
    
    constructor(props){
        super(props)        
    }

    alertError = () => {
		Swal.fire({
			icon: 'error',
			title: 'Erro',
			text: 'Ops! Tivemos algum problema, por favor tente novamente'		
		})
    }
    
    render() {
        return (
            <div>
                <Navbar/>
                <div id="container-index-fotografo">
                    <div className="container">
                        <div className="row">
                            <div className="col l10 s12 m12 offset-l2 offset-m0 offset-s0 ">
                                <div className="row">
                                    <div className="col l12 s12 m12">
                                        <h4 className="valign-wrapper" style={{color:'#641682',fontSize:'30px', fontFamily:"Montserrat-extrabold"}}>
                                            <i className="small material-icons left" style={{color:'#641682'}}>
                                                dehaze
                                            </i>Categorias
                                        </h4>
                                    </div>
                                    {/* CARD CAREGORIA */}
                                    <CardCategoria alertError={this.alertError}/>
                                </div>
                            </div>                            
                        </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Categoria;
