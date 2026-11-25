-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: loja_tech
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `vw_bi_vendas_detalhadas`
--

DROP TABLE IF EXISTS `vw_bi_vendas_detalhadas`;
/*!50001 DROP VIEW IF EXISTS `vw_bi_vendas_detalhadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_bi_vendas_detalhadas` AS SELECT 
 1 AS `id_pedido`,
 1 AS `data_pedido`,
 1 AS `status`,
 1 AS `cliente`,
 1 AS `categoria`,
 1 AS `produto`,
 1 AS `quantidade`,
 1 AS `preco_unitario`,
 1 AS `subtotal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_valor_estoque_produtos`
--

DROP TABLE IF EXISTS `vw_valor_estoque_produtos`;
/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque_produtos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_valor_estoque_produtos` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `preco`,
 1 AS `estoque`,
 1 AS `valor_total_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_pedidos_sistema_legado`
--

DROP TABLE IF EXISTS `vw_pedidos_sistema_legado`;
/*!50001 DROP VIEW IF EXISTS `vw_pedidos_sistema_legado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pedidos_sistema_legado` AS SELECT 
 1 AS `cod_pedido`,
 1 AS `cod_cliente`,
 1 AS `vl_total`,
 1 AS `situacao_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_clientes_marketing`
--

DROP TABLE IF EXISTS `vw_clientes_marketing`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_marketing`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_marketing` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nome`,
 1 AS `email`,
 1 AS `telefone`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_alerta_estoque_critico`
--

DROP TABLE IF EXISTS `vw_alerta_estoque_critico`;
/*!50001 DROP VIEW IF EXISTS `vw_alerta_estoque_critico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_alerta_estoque_critico` AS SELECT 
 1 AS `id_produto`,
 1 AS `produto`,
 1 AS `categoria`,
 1 AS `estoque_atual`,
 1 AS `estoque_minimo`,
 1 AS `unidades_faltantes`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_bi_vendas_detalhadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_bi_vendas_detalhadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bi_vendas_detalhadas` AS select `pe`.`id_pedido` AS `id_pedido`,`pe`.`data_pedido` AS `data_pedido`,`pe`.`status` AS `status`,`c`.`nome` AS `cliente`,`cat`.`nome` AS `categoria`,`pr`.`nome` AS `produto`,`ip`.`quantidade` AS `quantidade`,`ip`.`preco_unitario` AS `preco_unitario`,`ip`.`subtotal` AS `subtotal` from ((((`pedidos` `pe` join `clientes` `c` on((`pe`.`id_cliente` = `c`.`id_cliente`))) join `itens_pedido` `ip` on((`pe`.`id_pedido` = `ip`.`id_pedido`))) join `produtos` `pr` on((`ip`.`id_produto` = `pr`.`id_produto`))) join `categorias` `cat` on((`pr`.`id_categoria` = `cat`.`id_categoria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_valor_estoque_produtos`
--

/*!50001 DROP VIEW IF EXISTS `vw_valor_estoque_produtos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_valor_estoque_produtos` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`p`.`preco` AS `preco`,`p`.`estoque` AS `estoque`,(`p`.`preco` * `p`.`estoque`) AS `valor_total_estoque` from (`produtos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) where (`p`.`ativo` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_pedidos_sistema_legado`
--

/*!50001 DROP VIEW IF EXISTS `vw_pedidos_sistema_legado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pedidos_sistema_legado` AS select `pedidos`.`id_pedido` AS `cod_pedido`,`pedidos`.`id_cliente` AS `cod_cliente`,`pedidos`.`valor_total` AS `vl_total`,`pedidos`.`status` AS `situacao_pedido` from `pedidos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_clientes_marketing`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_marketing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_marketing` AS select `clientes`.`id_cliente` AS `id_cliente`,`clientes`.`nome` AS `nome`,`clientes`.`email` AS `email`,`clientes`.`telefone` AS `telefone` from `clientes` where (`clientes`.`ativo` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_alerta_estoque_critico`
--

/*!50001 DROP VIEW IF EXISTS `vw_alerta_estoque_critico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_alerta_estoque_critico` AS select `p`.`id_produto` AS `id_produto`,`p`.`nome` AS `produto`,`c`.`nome` AS `categoria`,`p`.`estoque` AS `estoque_atual`,`p`.`estoque_minimo` AS `estoque_minimo`,(`p`.`estoque_minimo` - `p`.`estoque`) AS `unidades_faltantes` from (`produtos` `p` join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) where ((`p`.`ativo` = true) and (`p`.`estoque` <= `p`.`estoque_minimo`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25  8:29:04
