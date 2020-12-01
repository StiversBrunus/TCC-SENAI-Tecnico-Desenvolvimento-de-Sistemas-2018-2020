import React from 'react'
import { MdCheckCircle, MdError } from "react-icons/md";
import { Container, Preview, FileInfo } from './css/styles'

const FileList = ({ files }) => (
    <Container>
        {files.map(uploadedFile => (
            <li key={uploadedFile.id}>
                <FileInfo>
                    <Preview src={uploadedFile.preview} />
                    <div>
                        <strong>{uploadedFile.name}</strong>
                        <span>{uploadedFile.readableSize}
                            {!!uploadedFile.url && (
                                <button>Excluir</button>
                            )}
                        </span>
                    </div>
                </FileInfo>
                <div>

                    {uploadedFile.uploaded && <MdCheckCircle size={24} color="#78e5d5" />}
                    {uploadedFile.error && <MdError size={24} color="#e57878" />}

                </div>
            </li>
        ))}
    </Container>
)

export default FileList
