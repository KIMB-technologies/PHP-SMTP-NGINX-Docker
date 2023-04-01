<?php
/**
 * Mail Test
 */
mail( 'test@example.com', 'Test Mail from Docker Image', 'Test ' . date( 'H:i:s d.m.Y' ) );
?>
