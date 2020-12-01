import React, { Component } from 'react';
import ClienteImg from './imagens/cliente.png'
import RotasCadastro from './RotasCadastro'
import BodyBackgroundColor from 'react-body-backgroundcolor'

export class CadastroFotografo extends Component {

    location = () => {
       this.props.history.push('/');
    }
    
    render() {
        return (
            <BodyBackgroundColor backgroundColor='#370b47' >
                <div style={{marginTop:'7%'}}>
                    <div className="container center ">
                        <div className="row" id='linha_img_cadastro' style={{ backgroundColor: '#641682' }}>
                            <RotasCadastro location={this.location}/>
                            <div className="col l6 s12 hide-on-med-only hide-on-small-only" id="coluna_imagem" style={{ paddingTop: '5em', marginBottom: '5em' }}>
                                <h4 style={{ marginBottom: '1em' }}>
                                    Faça seu cadastro!<br></br>
                                    agora
                                </h4>
                                <img className="" src={ClienteImg} alt="" style={{ marginBottom: '2em' }}></img>
                                <a href="">
                                    <h3>Já possui uma conta?<br></br>
                                    clique aqui para fazer o login</h3>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </BodyBackgroundColor>
        );
    }
}

export default CadastroFotografo;