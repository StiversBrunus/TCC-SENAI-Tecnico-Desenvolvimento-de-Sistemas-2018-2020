import React, { Component } from 'react'

// import BodyBackgroundColor from 'react-body-backgroundcolor'

class FormConfirmarDados extends Component {
    state = {
        dia: '',
        mes: '',
        ano: '',        
        hotaInicioEvento: '',
        horaFimEvento: '',
        enderecoEvento: '',
        dataEvento: '',
        cepEvento: '',
        numeroEvento: '',
        bairroEvento: '',
        cidadeEvento: '',
        estadoEvento: '',
        // cvcCartao: '',
        // validadeCartao: '',
        // nomeCartao: '',
        // numeroCartao: ''
    }

    componentDidMount() {
        const data = new Date();
        const { stateDados } = this.props
        console.log(stateDados)

        this.setState({
            dia: data.getDate(),
            mes: data.getMonth() + 1,
            ano: data.getFullYear(),
            hotaInicioEvento: stateDados.hotaInicioEvento,
            horaFimEvento: stateDados.horaFimEvento,
            enderecoEvento: stateDados.enderecoEvento,
            dataEvento: stateDados.dataEvento,
            cepEvento: stateDados.cepEvento,
            numeroEvento: stateDados.numeroEvento,
            bairroEvento: stateDados.bairroEvento,
            cidadeEvento: stateDados.cidadeEvento,
            estadoEvento: stateDados.estadoEvento,
            // cvcCartao: stateDados.cvcCartao,
            // validadeCartao: stateDados.validadeCartao,
            // nomeCartao: stateDados.nomeCartao,
            // numeroCartao: stateDados.numeroCartao
        })
    }

    voltar = e => {
        e.preventDefault();
        this.props.etapaAnterior();
    };

    proxima = () => {
		this.props.proximaEtapa();
	};

    render() {
        return (
            <div className="z-depth-5" style={{marginTop:'7%'}}>
                <div className="col s12 z-depth-4" style={{ backgroundColor: '#4e1766', padding: '20px' }}>
                    <div className="col s12">
                        <div className="col s12">
                            <h6 className="left" style={{ color: '#FFFFFF', fontSize: '20px' }}>Confirme os dados:</h6>
                        </div>
                        <div className="col s12">
                            <h6 className="left" style={{ color: '#FFFFFF', fontSize: '16px', fontFamily:'Montserrat-light' }}><span style={{ fontWeight: 'bold', fontFamily:'Montserrat-regular', letterSpacing:'1px' }}>Data da solicitação:</span> {this.state.dia + '/' + this.state.mes + '/' + this.state.ano}</h6>
                        </div>                        
                    </div>
                </div>

                <div className="col s6" style={{ backgroundColor: '#762795', padding: '20px'}}>
                    <div className="col s12">
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontWeight: 'bold', fontFamily:'Montserrat-regular', letterSpacing:'1px' }}>Local do evento:</h6>
                        <hr/>
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontFamily:'Montserrat-light'  }}>{this.state.enderecoEvento}, {this.state.numeroEvento}</h6>
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontFamily:'Montserrat-light'  }}>{this.state.cidadeEvento}- {this.state.estadoEvento}</h6>
                    </div>
                </div>

                <div className="col s6" style={{ backgroundColor: '#762795', padding: '20px'}}>
                    <div className="col s12">
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontWeight: 'bold', fontFamily:'Montserrat-regular', letterSpacing:'1px' }}>Dados do evento:</h6>
                        <hr style={{backgroundColor: '#641D85', color: '#641D85'}}/>
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontFamily:'Montserrat-light' }}>Dia: {this.state.dataEvento}</h6>
                        <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontFamily:'Montserrat-light' }}>Das {this.state.hotaInicioEvento} às {this.state.horaFimEvento}</h6>
                    </div>
                </div>
                <div className="col s12" style={{ backgroundColor: '#762795', padding: '20px'}}>
                    <h6 style={{ color: '#FFFFFF', fontSize: '15px', fontWeight: 'bold', fontFamily:'Montserrat-regular', letterSpacing:'1px' }}>Total:</h6>
                    <hr style={{ backgroundColor:'#DB92FE'}}></hr>
                    <h6 className="right" style={{ color: '#FFFFFF', fontSize: '22px', fontWeight: 'bold', fontFamily:'Montserrat-regular', letterSpacing:'1px' }}>R$ 100,00</h6>
                </div>

                <div className="col s12" style={{ backgroundColor: '#762795', padding: '20px'}}>
                    <h6 className="center" style={{ color: '#FFFFFF', fontSize: '12px', fontFamily:'Montserrat-light', letterSpacing:'1px' }}>O valor hora do fotógrafo foi multiplicado pela quantidade de horas do evento</h6>
                </div>

                <div className="col s12" style={{ backgroundColor: '#762795', padding: '20px'}}>
                    <div className="col s6 right">
                        <button style={{ marginRight:'3em' }} onClick={this.proxima} className="waves-effect waves-light btn right">
                            <i className="material-icons right">
                                arrow_forward
                            </i>Próximo
                        </button>
                    </div>
                    <div className="col s6 left">
                        <button style={{ marginLeft:'3em' }} onClick={this.voltar} className="waves-effect waves-light btn left">
                            <i className="material-icons left">
                                arrow_back
                            </i>Voltar
                        </button>
                    </div>
                </div>
            </div>

        )
    }
}

export default FormConfirmarDados
