import React, { Component } from 'react'
import FormDadosEvento from './dadosEvento/FormDadosEvento'
import FormDadosCartao from './dadosCartão/FormDadosCartao'
import FormConfirmarDados from './confirmaDados/FormConfirmarDados'

class RotasContratacao extends Component {

    state = {
        // etapa: 1,
        hotaInicioEvento: '',
        horaFimEvento: '',
        enderecoEvento: '',
        dataEvento: '',
        // pacoteEvento: '',
        // valueSelect: '',
        cepEvento: '',
        numeroEvento: '',
        bairroEvento: '',
        cidadeEvento: '',
        estadoEvento: '',

        cvcCartao: '',
        validadeCartao: '',
        // focus: '',
        nomeCartao: '',
        numeroCartao: '',

        loadding:false
    }

    //inputHandler
	handleChange = input => e => {
		this.setState({ [input]: e.target.value });
    };

    // proximaEtapa = () => {
	// 	const { etapa } = this.state;
	// 	this.setState({
	// 		etapa: etapa + 1
	// 	});
    // };
    
    // etapaAnterior = () => {
	// 	const { etapa } = this.state;
	// 	this.setState({
	// 		etapa: etapa - 1
	// 	});
    // };
    proximaEtapa = () => {
        this.props.proximaEtapa()
    };
    
    etapaAnterior = () => {
        this.props.etapaAnterior()
    };

    loadding = () => {
        this.props.loadding()
    }

    notLoadding = () => {
        this.props.notLoadding()
    }
    
    DadosEvento = (dados) => {
        // console.log(state.starttime)
        const state = dados;

		this.setState({
            hotaInicioEvento: state.starttime,
            horaFimEvento: state.endtime,
            enderecoEvento: state.enderecoEvento,
            dataEvento: state.startdate,
            // pacoteEvento: '',
            // valueSelect: '',
            cepEvento: state.cepEvento,
            numeroEvento: state.numeroEvento,
            bairroEvento: state.bairroEvento,
            cidadeEvento: state.cidadeEvento,
            estadoEvento: state.estadoEvento
			// dados: state1.bairroEvento
		});
        // this.setStateDados(state)
        // console.log(state)
        // console.log(this.state)
        this.proximaEtapa()
    }

    dadosCartao = (dados) => {
        const state = dados;

        this.setState({
            cvcCartao: state.cvc,
            validadeCartao: state.expiry,
            // focus: state.focus,
            nomeCartao: state.name,
            numeroCartao: state.number,
            // loadding: true
        })

        // console.log(this.state.dados)

        this.loadding()
        this.proximaEtapa()

    }

    location = () => {
		this.props.location();
	}   

    
    render() {
        // const { etapa } = this.state;
        const { etapa } = this.props;
        const { categoriaEvento } = this.props
        let state = this.state
        console.log(state)
        // const { idFotografo } = this.props
        
        // console.log(categoriaEvento)
        switch (etapa) {
            case 1:
				return (
                    <FormDadosEvento 
                        categoriaEvento={categoriaEvento}
                        proximaEtapa={this.proximaEtapa}
                        setStates={this.DadosEvento}
                        location={this.location}
                        />
                );           
            case 2:
                return (
                    <FormConfirmarDados 
                        stateDados={state}
                        proximaEtapa={this.proximaEtapa}
                        etapaAnterior={this.etapaAnterior}
                        />
                );
            case 3:
                return (
                    <FormDadosCartao 
                        etapaAnterior={this.etapaAnterior}
                        setStates={this.dadosCartao}/>
                );
        }
    }
}

export default RotasContratacao
