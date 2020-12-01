import React, { Component } from 'react'
import Cards from 'react-credit-cards';
import 'react-credit-cards/es/styles-compiled.css'

export default class FormDadosCartao extends Component {
    state = {
        cvc: '',
        expiry: '',
        focus: '',
        name: '',
        number: '',
        // loadding: false
    };

    handleInputFocus = (e) => {
        this.setState({ focus: e.target.name });
    }

    handleInputChange = (e) => {
        const { name, value } = e.target;

        this.setState({ [name]: value });
    }

    setStates = (e) => {
        e.preventDefault()
        this.props.setStates(this.state)
    }

    voltar = e => {
        e.preventDefault();
        this.props.etapaAnterior();
    };

    render() {
        return (
            <div className="row" style={{ padding: '1em', marginBottom: '0em',paddingTop:'0.2em',paddingLeft: '2em', paddingBottom:'0em', paddingRight:'2em', backgroundColor: '#ffffff', borderRadius: '5px', marginBottom:'0em'}}>
                {/* <div className="col s12">
                
            </div> */}
                <div className="col s6" style={{paddingTop:'5em'}} >
                    {/* <div className="col s12 center">
                        <h1 style={{ fontSize: "18px", color: '#6b1699', fontFamily: 'Montserrat-extrabold' }}>Insira os dados do seu cartão</h1>
                    </div> */}
                    <div className="col s12">
                        <Cards cvc={this.state.cvc}
                            expiry={this.state.expiry}
                            focused={this.state.focus}
                            name={this.state.name}
                            number={this.state.number} />
                    </div>
                </div>
                <div className="col s6">
                    <form>
                        <div className="input-field col s12">
                            <input type="tel" id="numeroCartao"
                                type="tel"
                                name="number"
                                // placeholder="Card Number"
                                onChange={this.handleInputChange}
                                onFocus={this.handleInputFocus} />
                            <label htmlFor="numeroCartao">Número do cartão:</label>
                        </div>

                        <div className="input-field col s12">
                            <input type="text" id="nomeCartao"
                                //  type="tel"
                                name="name"
                                // placeholder="Card Number"
                                onChange={this.handleInputChange}
                                onFocus={this.handleInputFocus} />
                            <label htmlFor="nomeCartao">Nome (igual ao cartão):</label>
                        </div>

                        <div className="input-field col s12">
                            <input
                                // type="text" 
                                id="validadeCartao"
                                type="tel"
                                name="expiry"
                                // placeholder="Card Number"
                                onChange={this.handleInputChange}
                                onFocus={this.handleInputFocus} />
                            <label htmlFor="validadeCartao">Data de expiração:</label>
                        </div>

                        <div className="input-field col s12">
                            <input type="text"
                                // name='cvc' 
                                id="cvvCartao"
                                type="tel"
                                name="cvc"
                                // placeholder="Card Number"
                                onChange={this.handleInputChange}
                                onFocus={this.handleInputFocus} />
                            <label htmlFor="cvvCartao">CVV:</label>
                        </div>
                    </form>

                </div>
                <div className="row">
                    <div className="col s6 right">
                        <button style={{ marginRight: '3em' }} onClick={this.setStates} className="waves-effect waves-light btn right">
                            <i className="material-icons right">
                                check
                            </i>Concluir
                        </button>
                    </div>
                    <div className="col s6 left">
                        <button style={{ marginLeft: '3em' }} onClick={this.voltar} className="waves-effect waves-light btn left">
                            <i className="material-icons left">
                                arrow_back
                            </i>Anterior
                        </button>
                    </div>
                </div>
            </div>
        )
    }
}


// import React, { useState } from 'react'
// import Cards from 'react-credit-cards'
// import 'react-credit-cards/es/styles-compiled.css'

// function FormDadosCartao() {
//     const [numero, setNumero] = useState('')
//     const [nome, setNome] = useState('')
//     const [validade, setValidade] = useState('')
//     const [cvc, setCvc] = useState('')
//     const [focus, setFocus] = useState('')

//     return (
//         <div className="row" style={{padding:'1em',marginBottom:'0em'}}>
//             {/* <div className="col s12">

//             </div> */}
//             <div className="col s6">
//                 <div className="col s12 center">
//                     <h1 style={{fontSize:"18px", color:'#641682', fontFamily:'Montserrat-medium'}}>Insira os dados do seu cartão</h1>
//                 </div>
//                 <div className="col s12">
//                     <Cards number={numero} name={nome} expiry={validade} cvc={cvc} focused={focus}/>
//                 </div>
//             </div>
//             <div className="col s6">
//                 <form>
//                     <div className="input-field col s12">
//                         <input type="tel" id="numeroCartao" name='number' value={numero} 
//                         onChange={e => setNumero(e.target.value)} onFocus={e => setFocus(e.target.name)}/>
//                         <label htmlFor="numeroCartao">Número do cartão:</label>
//                     </div>

//                     <div className="input-field col s12">
//                         <input type="text" id="nomeCartao" name='name' value={nome}
//                         onChange={e => setNome(e.target.value)} onFocus={e => setFocus(e.target.name)} />
//                         <label htmlFor="nomeCartao">Nome (igual ao cartão):</label>
//                     </div>

//                     <div className="input-field col s12">
//                         <input type="text" id="validadeCartao" name='expiry' value={validade} 
//                         onChange={e => setValidade(e.target.value)} onFocus={e => setFocus(e.target.name)} />
//                         <label htmlFor="validadeCartao">Data de expiração:</label>
//                     </div>

//                     <div className="input-field col s12">
//                         <input type="text" name='cvc' id="cvvCartao" value={cvc} 
//                         onChange={e => setCvc(e.target.value)} onFocus={e => setFocus(e.target.name)}/>
//                         <label htmlFor="cvvCartao">CVV:</label>
//                     </div>







//                 </form>
//             </div>
//         </div>
//     )
// }

// export default FormDadosCartao
