-- Migration: 20260928_task_category
-- Description: Adiciona categoria às tarefas do módulo de referência Tasks

-- Consulta 001: Criação do tipo enum para categoria
CREATE TYPE "TaskCategory" AS ENUM ('WORK', 'PERSONAL', 'STUDY', 'HEALTH', 'OTHER');

-- Consulta 002: Nova coluna com valor padrão para as tarefas já existentes
ALTER TABLE "tasks" ADD COLUMN "category" "TaskCategory" NOT NULL DEFAULT 'OTHER';

-- Consulta 003: Índice para o filtro por categoria
CREATE INDEX "tasks_category_idx" ON "tasks"("category");
