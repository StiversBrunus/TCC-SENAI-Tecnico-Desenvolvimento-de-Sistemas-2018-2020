import React, { Component } from 'react';
import FotografosImg from './imagens/fotografo.png'
import RotasCadastro from './RotasCadastro'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import './css/custom.css'

export class CadastroFotografo extends Component {

    location = () => {
        this.props.history.push('/');
    }

    render() {
        return (
            <BodyBackgroundColor backgroundColor='#370b47' >
                <div style={{paddingTop:'7%'}}>
                    <div className="container center ">
                        <div className="row" id='linha_img_cadastro' style={{ backgroundColor: '#641682' }}>
                            <div className="col l6 s12 hide-on-med-only hide-on-small-only" id="coluna_imagem" style={{ paddingTop: '5em', marginBottom: '5em' }}>
                                <h4 style={{ marginBottom: '1em' }}>
                                    Faça seu cadastro!<br/>
                                    agora
                                </h4>
                                <img src={FotografosImg} alt="" style={{ marginBottom: '2em' }}></img>
                                <a href="">
                                    <h3>Já possui uma conta?<br/>
                                    clique aqui para fazer o login</h3>
                                </a>
                            </div>
                            <RotasCadastro location={this.location} />
                        </div>
                    </div>
                </div>
            </BodyBackgroundColor>
        );
    }
}

export default CadastroFotografo;