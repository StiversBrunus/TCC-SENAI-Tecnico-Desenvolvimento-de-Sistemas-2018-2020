import React, { Component } from 'react'
import Dropzone from 'react-dropzone'
import { DropContainer, UploadMessage } from "./css/style";

class Upload extends Component {
    MensagemContainer(isDragActive, isDragReject){
        if(!isDragActive){
            return <UploadMessage>Arraste arquivos aqui...</UploadMessage>
        }

        if(isDragReject){
            return <UploadMessage type="error">Arquivo não suportado</UploadMessage>;
        }

        return <UploadMessage type="success">Solte os arquivos aqui</UploadMessage>
    }

    render() {

        const { onUpload } = this.props;
        return (
            <Dropzone accept='image/*' onDropAccepted={(onUpload)}>
                { ({ getRootProps, getInputProps, isDragActive, isDragReject }) => (
                    <DropContainer
                    {...getRootProps()}
                    isDragActive={isDragActive}
                    isDragReject={isDragReject}
                    >
                    <input {...getInputProps()}/>
                    {this.MensagemContainer(isDragActive, isDragReject)}
                    </DropContainer>
                ) }
            </Dropzone>
        )
    }
}

export default Upload

