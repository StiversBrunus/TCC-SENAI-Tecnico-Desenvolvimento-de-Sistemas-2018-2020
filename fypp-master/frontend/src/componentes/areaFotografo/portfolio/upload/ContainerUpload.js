import React, { Component } from 'react'
import BodyBackgroundColor from 'react-body-backgroundcolor'
import Upload from './Upload'
import FileList from './fileList/FileList'
import { uniqueId } from 'lodash'
import filesize from 'filesize'
import api from '../../../../services/api'
import { Titulo, Subtitulo } from './css/style.js'
import { alertSucess, alertError } from '../../../alerts/alert'

class ContainerUpload extends Component {
    state = {
        uploadedFiles: [],
        // filename: '',
        // mimetype: '',
        // base64: '',
        urlImagens: '',
        idPortfolio:'',
        idFoto:'',
        dados : {
            filename: '',
            mimetype: '',
            base64: '',
        }
    }

    // componentDidMount () {
    //     const id = this.props.match.params.idPortfolio


    //     console.log(id)
    // }   

    salvar = () => {
        this.state.uploadedFiles.forEach(this.processUpload);
        console.log(this.state)
    }
    
    handleUpload = files => {
        const uploadedFiles = files.map(file => ({
            file,
            id: uniqueId(),
            type: file.type,
            name: file.name,
            readableSize: filesize(file.size),
            preview: URL.createObjectURL(file)
        }));

        this.setState({
            uploadedFiles: this.state.uploadedFiles.concat(uploadedFiles)
        });
        
    };    
    
    processUpload =  (file) => {
        let reader = new FileReader();
        reader.readAsDataURL(file.file);
        
        const token = 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmb3RvZ3JhZm9AdGVzdGUuY29tIiwicm9sZXMiOlsiQURNSU4iXSwiaWF0IjoxNTkyODM0Njc0LCJleHAiOjE1OTI5MjEwNzR9.p4NfLYnyfl6XMBrIAAmMR-r2HpyPFDJfuoH8pkzpHR-BNqS_S2JyAzklig-gXVH_ce9plTUX9KTrtmXcpgF8yA'
        let data = reader.result
        let config = {
            headers: {
                'Authorization': token,
                "Accept":"application/json",
                'Content-Type': 'application/json'
            }
        }

        reader.onloadend =  async () =>{
            let base64result = reader.result.split(',')[1]
            this.setState({                
                // base64: reader.result.split(',')[1]
                dados: {
                    filename: Date.now() + file.name.split(' ')[0],
                    mimetype: file.type,
                    base64: base64result
                }
            })

            console.log(this.state.dados)

            await api.post("/photo/upload/imagem", this.state.dados, config).then(res => {
                    // console.log(res.data)
                    console.log(res)
                    this.setState({
                        urlImagens: res.data
                        // .split(',')[1]
                    })
                    // alertSucess('Obrigado', 'Portfólio criado com sucesso')
        
                    this.fotoPortfolio(file);
        
                    // this.props.history.push('/fotografo/portfolio')
                }).catch(erro => {
                    console.log(erro)
                    alertError('Erro ao criar portfólio', 'Tivemos algum problema para criar o porfólio, por favor tente novamente' )
                })
        }

        
        // 
    }



    fotoPortfolio = async (file) => {
        console.log(this.state.urlImagens)
        const id = this.props.match.params.idPortfolio
        console.log(id)

        
        
        
        let dados = {
            descricao: 'teste',
            nome: Date.now() + file.name.split(' ')[0],
            // + file.name.replace(' ', ""),
            url: this.state.urlImagens,
            id_portfolio: id
        }

        console.log(dados)

        await api.post('/photo/fotoPortfolio/', dados).then(res => {
            console.log(res)
            alertSucess('Obrigado', 'Portfólio criado com sucesso')
        }).catch(erro => {
            console.log(erro)
            // alertError('Erro ao criar portfólio', 'Tivemos algum problema para criar o porfólio, por favor tente novamente' )
        })
        console.log(dados)
            
            // await api.post("")
        // })
    }

    voltar = () => {
        this.props.history.push('/fotografo/portfolio/nome')
    }
    
    render() {
        const { uploadedFiles } = this.state
        return (
            <div style={{marginBottom:'0'}} className="container">
                <BodyBackgroundColor backgroundColor='#641682' style={{ boxSizing: 'border-box' }} >
                    <div style={{marginBottom:'0em'}}>
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
                                {this.state.uploadedFiles.length >= 5 && 
                                    <a className="right" onClick={this.salvar} style={{color:"#FFFFFF", cursor:'pointer'}}>
                                        <i className="material-icons left">
                                            check
                                        </i>
                                    </a>
                                }
                                </div>
                            </div> 

                            <Titulo className="center">
                                Selecione as fotos para o seu portfólio
                            </Titulo>
                            <Subtitulo className="center">
                                Selecione no mínimo 5 imagens
                            </Subtitulo>
                        </div>
                        <div style={{ boxSizing: 'border-box', height: '100%', display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                            <div style={{ boxSizing: 'border-box', width: '100%', maxWidth: '400px', margin: '30px', backgroundColor: '#FFFFFF', borderRadius: '4px', padding: '15px' }}>
                                <Upload onUpload={this.handleUpload} />
                                {!!uploadedFiles.length && (<FileList files={uploadedFiles} />)}
                            </div>
                        </div>
                    </div>
                </BodyBackgroundColor>
            </div>
        )
    }
}

export default ContainerUpload



// progress: 0,
            // uploaded: false,
            // error: false,
            // url: null