package com.elitemastereric.resourcetrees;

import com.elitemastereric.resourcetrees.common.ModCreativeTab;
import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.common.items.ModItems;
import com.elitemastereric.resourcetrees.common.worldgen.ModWorldGen;
import net.pickhaxe.core.CommonMod;
import net.pickhaxe.core.Environment;

@:mod
class ResourceTreesMod extends CommonMod {
  public override function onModInitialize():Void {
    #if fabric
    LOGGER.info('Hello Fabric! Welcome to Minecraft ${Environment.MINECRAFT_VERSION}!');
    #end

    #if forge
    LOGGER.info('Hello Forge! Welcome to Minecraft ${Environment.MINECRAFT_VERSION}!');
    #end
  }

  public override function onRegister():Void {
    ModBlocks.register();
    ModItems.register();
    ModWorldGen.register();
  }

  public override function onCreativeModeTabRegister():Void {
    ModCreativeTab.registerCreativeTab();
  }
}