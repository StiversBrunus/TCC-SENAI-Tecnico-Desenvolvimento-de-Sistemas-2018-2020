import React, { Component } from 'react'

class selectExperiencia extends Component {
    render() {
        return (
            <div className="col s12">
                <select id={this.props.id} onChange={this.props.onChange}>
                    <option defaultValue>Selecione:</option>
                    <option value="amador">Amador</option>
                    <option value="profissional">Profissional</option> 
                </select>
            </div>
        )
    }
}

export default selectExperiencia
