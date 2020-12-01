import React, { Component } from 'react'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import { Titulo, InputName } from './css/style'
import api from '../../../../services/api'


class CriarPacote extends Component {

    state = {
        nomePacote: '',
        descricaoPacote:'',
        precoPacote:''
    }

    voltar = () => {
        this.props.history.push('/fotografo/pacotes')
    }

    handleChange = input => e => {
		this.setState({ [input]: e.target.value });
    };
    
    salvarPacote = async () => {
        let dados = {
            descricao: this.state.descricaoPacote,
            nome_pacote: this.state.nomePacote,
            preco: this.state.precoPacote
        }

        await api.post("/photo/pacote/", dados)
            .then((res) => {
                console.log('funcionou')
                console.log(res)

                // this.props.history.push('/fotografo/portfolio/nome/' + res.data.id + '/fotos')
            }).catch(erro => {
				console.log(erro)
			})
    }
    
    render() {
        return (
            <div>
            <BodyBackgroundColor backgroundColor='#641682' style={{ boxSizing: 'border-box' }} >
                <div className="container">
                    <div className="col s12" style={{paddingTop:'2em'}}>
                        <div className="row" >
                            <div className="col s6">
                                <a onClick={this.voltar} className="left" style={{color:"#FFFFFF", cursor:'pointer'}}>
                                    <i className="small material-icons">
                                        clear
                                    </i>
                                </a>
                            </div>
                            <div className="col s6 right">
                            {this.state.nomePacote != "" && this.state.descricaoPacote != "" && this.state.precoPacote != "" &&
                                <a className="right" onClick={this.salvarPacote} style={{color:"#FFFFFF", cursor:'pointer'}}>
                                    <i className="material-icons left">
                                        arrow_forward
                                    </i>
                                </a>
                            }
                            </div>
                        </div> 

                        <Titulo className="center">
                            Nome:
                        </Titulo>

                        <div className="row center" style={{marginBottom:'3em'}}>
                            <div className="col s12 center"> 
                                <div className="center">
                                    <div className="input-field col s6 center offset-s3">
                                        <InputName type="text" className="center" onChange={this.handleChange('nomePacote')} maxLength="50" placeholder="Ex: Básico" style={{fontSize:'20px'}}/>
                                    </div>
                                </div>
                            </div>
                                                        
                        </div>

                        <Titulo className="center">
                            Valor por hora:
                        </Titulo>
                        <div className="row center">
                            <div className="col s12 center"> 
                                <div className="center">
                                    <div className="input-field col s8 center offset-s2">
                                        <div className="input-field col s12">
                                            <InputName type="number" className="center" onChange={this.handleChange('precoPacote')} maxLength="5" placeholder="80,00" style={{fontSize:'20px'}}/>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>

                        <Titulo className="center">
                            Faça uma pequena descrição:
                        </Titulo>
                        <div className="row center">
                            <div className="col s12 center"> 
                                <div className="center">
                                    <div className="input-field col s8 center offset-s2">
                                        <div className="input-field col s12">
                                            <textarea id="textarea1" onChange={this.handleChange('descricaoPacote')} placeholder='Ex: Esse pacote inclui fotos em um CD dígital' maxLength="150" style={{fontSize:'20px', fontFamily:'Montserrat-light', color:'#f8f8f8'}} className="materialize-textarea center"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                        </div>

                        

                        {/* <div className="row">
                            <div className="col s1 offset-s9" style={{ marginTop:'1em'}} >
                                <button  style={{borderRadius:"50px", cursor:'pointer', height:'3em', width:'3em', backgroundColor:'#641682', border:'2px solid #FFFFFF'}}>
                                    <i className="small material-icons left" style={{color:'#ffffff'}}>
                                        arrow_forward
                                    </i>
                                </button>
                            </div>
                        </div> */}

                    </div>
                </div>
            </BodyBackgroundColor>
        </div>
        )
    }
}

export default CriarPacote