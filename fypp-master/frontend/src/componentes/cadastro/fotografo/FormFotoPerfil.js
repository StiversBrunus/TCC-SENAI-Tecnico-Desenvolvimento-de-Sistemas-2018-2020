import React, { Component } from 'react';

export class FormFotoPerfil extends Component {

    voltar = e => {
        e.preventDefault();
        this.props.etapaAnterior();
    };

    onChange = (e) => {
        this.props.handleImageChange(e);        
    }

    cadastrar = e => {
        e.preventDefault();
        this.props.cadastrar();
    }

    render() {
        return (
            <div id="coluna_dados_cadastro" className="col l6 s12 m12 center" style={{ paddingTop: '1em', backgroundColor: '#ffffff', borderTopRightRadius: '0.5em', borderBottomrightRadius: '0.5em' }}>
                <h4 style={{ marginBottom: '2.5em' }}>
                    Estamos quase finalizando o seu cadastro.<br></br>
                    Agora por favor selecione uma foto <br></br>
                    para ser exibida no seu perfil.                    
                </h4>

                <div className="row">
                    <div className="col s12" style={{marginBottom:'2em', marginLeft:'1em'}}>
                        <div className="col s5 offset-s3" style={{height:'10em', borderRadius:'50%'}}>
                            <img id="fotoDePerfil" className="responsive-img" style={{width:'100%', height:'100%', borderRadius:'50%', border:'2px solid #641682'}}></img>
                        </div>
                    </div>
                    <form className="col s12">
                        <div className="file-field input-field" style={{marginBottom:'3.5em'}}>
                            <div className="btn" >
                                <span>Selecione a Imagem</span>
                                <input type="file" onChange={(e)=>this.onChange(e)}></input>
                            </div>
                            <div className="file-path-wrapper">
                                <input className="file-path validate" id='imgPerfil' type="text"></input>
                            </div>
                        </div>

                        <div className="row">
                            <div className="valign-wrapper col s6">
                                <button onClick={this.voltar} className="right-align waves-effect waves-light btn right">
                                    <i className="material-icons left">
                                        arrow_back
                                    </i>Anterior
                                </button>                                   
                            </div>

                            <div className="col s6">
                                <button onClick={this.cadastrar} className="left-align waves-effect waves-light btn right">
                                    <i className="material-icons right">
                                        check
                                    </i>Concluir
                                </button>
                            </div>                            
                        </div>

                    </form>
                </div>
            </div>
        );
    }
}

export default FormFotoPerfil;