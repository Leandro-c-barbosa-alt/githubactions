const { DefaultArtifactClient } = require('@actions/artifact');

async function uploadArtifact() {
    // Obtém o nome do arquivo do argumento de execução
    const artifactName = process.argv[2];
    const runId = process.env.GITHUB_RUN_ID;
    const repo = process.env.GITHUB_REPOSITORY;
    const token = process.env.ACTIONS_RUNTIME_TOKEN;
    
    if (!artifactName) {
        console.error("Erro: Você deve fornecer o nome do arquivo para upload.");
        process.exit(1);
    }

    const files = [`../${artifactName}`]; // Lista de arquivos para upload
    const rootDirectory = '../'; // Diretório base onde o arquivo está armazenado

    const options = {
        retentionDays: 10 // Define o tempo que o artefato ficará disponível (opcional)
    };

    try {
        const artifactClient = new DefaultArtifactClient();
        const { id, size } = await artifactClient.uploadArtifact(artifactName, files, rootDirectory, options);
        console.log(`✅ Upload concluído: ID=${id}, Tamanho=${size} bytes`);
    } catch (error) {
        console.error('❌ Erro no upload:', error);
        process.exit(1);
    }
}

// Executa a função principal
uploadArtifact();
