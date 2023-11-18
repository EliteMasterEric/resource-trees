package com.elitemastereric.resourcetrees;

import com.elitemastereric.resourcetrees.common.ModCreativeTab;
import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.common.items.ModItems;
import net.pickhaxe.core.DataGenerator;
import net.pickhaxe.core.Environment;

@:mod
class ResourceTreesDataGenerator extends DataGenerator {
  public override function onModInitialize():Void {
    #if fabric
    LOGGER.info('Hello Fabric! Welcome to Minecraft ${Environment.MINECRAFT_VERSION}!');
    #end

    #if forge
    LOGGER.info('Hello Forge! Welcome to Minecraft ${Environment.MINECRAFT_VERSION}!');
    #end

    ModBlocks.registerRenderers();
  }
}