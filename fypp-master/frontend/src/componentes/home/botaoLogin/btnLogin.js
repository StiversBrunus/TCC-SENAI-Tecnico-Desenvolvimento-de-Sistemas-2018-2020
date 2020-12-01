import React, { Component } from 'react'
import { Link } from 'react-router-dom'

document.addEventListener('DOMContentLoaded', function () {
    const M = window.M;
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems, {hover:'true'});
});

class btnLogin extends Component {
    render() {
        return (
            <li style={{ color: '#641682' }}>
                <ul id="dropdown2" className="dropdown-content">
                    <li>
                        <Link to="/cliente/login">
                            Cliente
                        </Link>
                    </li>
                    <li>
                        <Link to="/fotografo/login">
                            Fotografo
                        </Link>
                    </li>
                </ul>
                <a className="btn dropdown-trigger white" href="#!" style={{ color: '#641682' }} data-target="dropdown2">Login</a>
            </li>
        )
    }
}

export default btnLogin
