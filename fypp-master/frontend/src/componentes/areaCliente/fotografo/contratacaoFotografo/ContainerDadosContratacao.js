import React, { Component } from 'react'
import RotasContratacao from './RotasContratacao'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import api from '../../../../services/api'
import { Titulo, Subtitulo } from './css/style.js'
import Loading from '../../../loading/LoadingFullScreen'

export default class ContainerDadosContratacao extends Component {
    state = {
        categoriaEvento:[],
        etapa:1,
        loadding: false
    }

    // voltar = (props) => {
    //     // const { idFotografo } = this.props
        
    //     this.props.history.push('/cliente/fotografos/')
    // }

    componentDidMount() {
        let id = this.props.match.params.idFotografo

        let token = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbkBhZG1pbi5jb20iLCJyb2xlcyI6WyJBRE1JTiJdLCJpYXQiOjE1OTEyNzA5NDEsImV4cCI6MTU5MTM1NzM0MX0.du69f5OTlkCmc6J6okqGdLqLy_xKq4XxESUwuW_mkFpNNa8w-8Mt7-f3pFt_zCJ6TDBY9KYqc-URMvr14BPSog"
        let config = {
            headers: {
                'authorization': token,
                'Access-Control-Allow-Origin': '*'
            }
        }

        api.get('/photo/fotografos/' + id)
            .then((res) => {
                this.setState({
                    categoriaEvento: res.data.especialidades
                })

                // console.log(this.state.categoriaEvento)

            }).catch(erro => {
                console.log(erro)
            })
    }

    location = () => {
        let id = this.props.match.params.idFotografo
        this.props.history.push('/cliente/fotografos/' + id);
    }

    proximaEtapa = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa + 1
		});
    };
    
    etapaAnterior = () => {
		const { etapa } = this.state;
		this.setState({
			etapa: etapa - 1
		});
    };

    loadding = () => {
		this.setState({
			loadding: true
		});
    };

    notLoadding = () => {
		this.setState({
			loadding: false
		});
    };
    

    render() {
        const { etapa } = this.state

        return (
            <div>
                {this.state.loadding === true ? <Loading/> :
                <BodyBackgroundColor backgroundColor='#641682' >
                <div className="container">
                    
                    <div>
                        {/* {this.state.etapa === 1 && */}
                        <div>
                            <div className="row">   
                            {this.state.etapa === 1 &&           
                                <div>
                                    <Titulo className="center">
                                        WOW! Oi {localStorage.getItem('nomeCliente')}, então você encontrou o fotógrafo perfeito para o seu evento ?
                                    </Titulo>
                                    <Subtitulo className="center">
                                        Precisamos de alguns dados do evento para solicitar o fotógrafo
                                    </Subtitulo>
                                </div>  
                            }
                             {this.state.etapa === 3 &&           
                                <div>
                                    <Titulo className="center">
                                        WOW! Oi {localStorage.getItem('nomeCliente')}, então você encontrou o fotógrafo perfeito para o seu evento ?
                                    </Titulo>
                                    <Subtitulo className="center">
                                        Precisamos dos dados do cartão para efetuar o pagamento
                                    </Subtitulo>
                                </div>  
                            }
                            </div>
                        </div>
                        {/* } */}
                        <div className="row">
                            <div className="col s12"
                            // style={{ paddingTop:'0.2em',paddingLeft: '2em', paddingBottom:'0em', paddingRight:'2em', backgroundColor: '#ffffff', borderRadius: '5px' }}
                            >
                                <RotasContratacao 
                                    categoriaEvento={this.state.categoriaEvento}
                                    location={this.location} 
                                    etapa={etapa}
                                    proximaEtapa={this.proximaEtapa}
                                    etapaAnterior={this.etapaAnterior}
                                    loadding={this.loadding}
                                    notLoadding={this.notLoadding}
                                    />
                            </div>
                        </div>
                    </div>
                    {/* : 
                    <div className="row" style={{paddingTop:'10%'}}>
                        <div className="col s12">
                            <RotasContratacao 
                                // categoriaEvento={this.state.categoriaEvento}
                                location={this.location} 
                                etapa={etapa}
                                proximaEtapa={this.proximaEtapa}
                                etapaAnterior={this.etapaAnterior}
                                />
                        </div>
                    </div>
                    } */}
                </div>
            </BodyBackgroundColor>}
            </div>
        )
        // return (
        //     <div>
        //         <RotasContratacao categoriaEvento={this.state.categoriaEvento}/>
        //     </div>
        // )
    }
}
