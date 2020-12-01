import React, {Component} from 'react'
import FormFotografo from './FormLoginFotografo'
import FotografosImg from './imagens/fotografo.png'
import VoltarHome from '../VoltarHome'

class ModalLoginFotografo extends Component {

    location = () => {
        this.props.history.push('/fotografo/trabalhos');
    }

    render() {
        return (
            <div>
                <VoltarHome/>   
                <div style={{marginTop:'1%'}}>
                    <div className="container center ">
                        <div className="row" id='linha_img_cadastro' style={{ backgroundColor: '#641682' }}>
                            <FormFotografo location={this.location}/>
                            <div className="col l6 s12 hide-on-med-only hide-on-small-only" id="coluna_imagem" style={{ paddingTop: '5em', marginBottom: '5em' }}>
                                <h4 style={{ marginBottom: '1em' }}>
                                    Faça login na sua<br></br>
                                    conta agora
                                </h4>
                                <img src={FotografosImg} alt="" style={{ marginBottom: '2em' }}></img>
                                <a href="">
                                    <h3>Ainda não possui uma conta?<br></br>
                                    clique aqui para fazer cadastro</h3>
                                </a>
                            </div>                        
                        </div>
                    </div>
                </div>
            </div>
        );
    }

}

export default ModalLoginFotografo;
