import React, { Component } from 'react'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import '../css/style.css'
import TimePicke from './TimePicker'
import DataPicker from './DataPicker'

class SelecaoData extends Component {

    state = {
        data: 'aaa',
        hora: ''
    }

    handleChange = input => e => {
        this.setState({ [input]: e.target.value });
    };

    proxima = () => {
        console.log('nadaaaaa')
    }


    render() {
        const { data, hora } = this.state;
        const values = { data, hora };

        return (
            <div style={{paddingTop:'13em'}}>
                <BodyBackgroundColor backgroundColor='#641682' >
                    <div className="container">
                        <div className="row">
                            <div className="col s12">
                                <h5 className="center" style={{ fontSize: '30px', fontFamily: "Montserrat-extrabold", color: '#ffffff', cursor: 'default' }}>
                                    Escolha a data e a hora para o seu evento !
                                </h5>
                            </div>
                        </div>
                        <div className="row center-align">
                            <div className="col s8 offset-s2 valign-wrapper"> 
                                <div className="center">
                                    <DataPicker handleChange={this.handleChange} handleDate={this.handleDate} values={values}/>                                    
                                    <h1 className="col s2" style={{ color:'#ffffff',  fontFamily: "Montserrat", fontSize: '25px',height:'2em', marginTop:'0px', paddingTop:'0.5em', boxSizing:'border-box'}}>às</h1>
                                    <TimePicke handleChange={this.handleChange} values={values}/>
                                </div>
                            </div>
                        </div>
                        <div className="row right">
                            <i onClick={this.proxima} style={{color:'#ffffff', cursor:'pointer'}} className="small material-icons">arrow_forward</i>
                            
                        </div>
                        <div className="row center">
                            <p style={{fontFamily:'Montserrat-medium', color:'#FFFFFF', marginTop:'15em'}}>
                                listaremos todos os fotógrafos disponiveis para está data
                            </p>
                        </div>
                    </div>
                </BodyBackgroundColor >
            </div>
        )
    }
}

export default SelecaoData
