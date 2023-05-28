# Introduction

A very simple script to test out using embeddings to find custom knowledge data and return that from ChatGPT (e.g. Embed FAQ from a website etc)

Based of this article - https://blog.theodo.com/2023/05/gpt-with-custom-knowledge/

# Usage

1. Open pgvector_embeddings_sample folder with VSCode
2. Run the dev container in vscode using the configurations from `.devcontainers` folder, which will create the PostgreSQL inside a docker container.
3. Connect to the PostgreSQL instance inside the container and do the following -
   * Run `create_openai_db.pgsql` to create a new database called `openai`
   * Run `create_embedding.pgsql` and `create_embedding_vector_search_pgsql`
4. Run `npm install`
5. Update index.js with your own OpenAI API key
6. Run `npm run start`
