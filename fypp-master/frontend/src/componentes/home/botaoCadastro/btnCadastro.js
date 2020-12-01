import React, { Component } from 'react'
import { Link } from 'react-router-dom'

document.addEventListener('DOMContentLoaded', function () {
    const M = window.M;
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, {});
});

class btnCadastro extends Component {
    render() {
        return (
            <li style={{ color: '#641682', listStyle:'none' }}>
                <ul id="dropdown3" className="dropdown-content">
                    <li>
                        <Link to="/cliente/cadastro">
                            Cliente
                        </Link>
                    </li>
                    <li>
                        <Link to="/fotografo/cadastro">
                            Fotografo
                        </Link>
                    </li>
                </ul>
                <a className="waves-effect waves-light btn-large dropdown-trigger" href="#!" style={{ color: '#641682' }} data-target="dropdown3">Cadastre-se</a>
            </li>
        )
    }
}

export default btnCadastro