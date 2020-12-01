import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import M from 'materialize-css'


class VoltarHome extends Component {

    componentDidMount(){
        document.addEventListener('DOMContentLoaded', function() {
            var elems = document.querySelectorAll('.tooltipped');
            var instances = M.Tooltip.init(elems, {});
          });
        
    }
    render() {
        return (
            <div className="" style={{marginLeft:'8em',marginTop:'3em'}}>
                <Link to="/" className="brand-logo tooltipped" data-position="right" data-tooltip="Voltar"><i className="small material-icons">arrow_back</i></Link>
            </div>
        )
    }
}

export default VoltarHome
