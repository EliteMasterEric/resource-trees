package com.elitemastereric.resourcetrees;

import com.elitemastereric.resourcetrees.common.ModCreativeTab;
import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.common.items.ModItems;
import net.pickhaxe.core.ClientMod;
import net.pickhaxe.core.Environment;

@:mod
class ResourceTreesClientMod extends ClientMod {
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