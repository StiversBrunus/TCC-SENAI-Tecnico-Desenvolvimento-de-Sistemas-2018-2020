import React, { Component } from 'react'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import { Titulo, InputName } from './css/styles'
import api from '../../../../services/api'


class CriarPorftolio extends Component {
    constructor(props) {
		super(props)	
    }
    
    state = {
        id_fotografo: localStorage.getItem('idFotografo'),
        nome: "",
        descricao: ""
    }

    salvarPortfolio = async () => {
        // console.log()

        console.log(this.state)

        await api.post("/photo/portfolio/", this.state)
            .then((res) => {
                console.log('funcionou')
                console.log(res)

                this.props.history.push('/fotografo/portfolio/nome/' + res.data.id + '/fotos')
            }).catch(erro => {
				console.log(erro)
			})
    }

    setNome = (e) => {
        this.setState({
			nome: e.target.value
		});
    }
    
    setDescricao = (e) => {
        this.setState({
			descricao: e.target.value
		});
    }
    
    voltar = () => {
        this.props.history.push('/fotografo/portfolio')
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
                                {this.state.nome != "" && this.state.descricao != "" && 
                                    <a className="right" onClick={this.salvarPortfolio} style={{color:"#FFFFFF", cursor:'pointer'}}>
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
                                            <InputName className="center" onChange={this.setNome} maxLength="50" placeholder="Ex: Casamento" style={{fontSize:'20px'}}/>
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
                                                <textarea id="textarea1" onChange={this.setDescricao} placeholder='Ex: Essas fotos fiz para um casal de amigos' maxLength="150" style={{fontSize:'20px', fontFamily:'Montserrat-light', color:'#f8f8f8'}} className="materialize-textarea center"></textarea>
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

export default CriarPorftolio
