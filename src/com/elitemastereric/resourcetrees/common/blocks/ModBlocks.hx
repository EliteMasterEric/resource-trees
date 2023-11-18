package com.elitemastereric.resourcetrees.common.blocks;

import com.elitemastereric.resourcetrees.ResourceTreesMod;
import com.elitemastereric.resourcetrees.common.worldgen.grower.GoldTreeGrower;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.client.renderer.RenderType;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.world.level.block.RotatedPillarBlock;
import net.minecraft.world.level.block.SaplingBlock;
import net.minecraft.world.entity.EntityType;

import net.minecraft.world.level.material.PushReaction;
import net.minecraft.world.level.block.SoundType;
import net.minecraft.world.level.block.state.BlockBehaviour.Properties as BlockProperties;

import net.pickhaxe.compat.world.level.material.MapColor;
import net.pickhaxe.compat.world.level.block.Block;

/**
 * Holds references to all of our blocks,
 * and handles adding them to the blocks registry.
 */
class ModBlocks
{
  /**
   * BLOCK BEHAVIOR PROPERTIES
   */
  // ===============
  public static final PROPERTIES_PLANKS:BlockProperties = BlockProperties.of().mapColor(WOOD).instrument(BASS).strength(2.0, 3.0).sound(SoundType.WOOD).ignitedByLava();
  public static final PROPERTIES_SAPLING:BlockProperties = BlockProperties.of().mapColor(PLANT).noCollission().randomTicks().instabreak().sound(SoundType.GRASS).pushReaction(PushReaction.DESTROY);
  
  /**
   * BLOCKS
   */
  // ===============
  
  // Gold
  public static final GOLD_LEAVES:Block = Blocks.leaves(SoundType.GRASS);
  public static final GOLD_LOG:Block = Blocks.log(WOOD, PODZOL);
  public static final GOLD_PLANKS:Block = new Block(PROPERTIES_PLANKS);
  public static final GOLD_SAPLING:Block = new SaplingBlock(new GoldTreeGrower(), PROPERTIES_SAPLING);
  public static final GOLD_WOOD:Block = Blocks.log(WOOD, PODZOL);

  // Stripped Logs
  public static final GOLD_STRIPPED_LOG:Block = Blocks.log(WOOD, PODZOL);

  // Stripped Wood
  public static final GOLD_STRIPPED_WOOD:Block = Blocks.log(WOOD, PODZOL);

  /**
   * Adds all of our blocks to the blocks registry.
   */
  public static function register():Void
  {
    ResourceTreesMod.LOGGER.info("Registering blocks...");

    GOLD_LOG.flammable(5, 5).strippable(GOLD_STRIPPED_LOG);
    GOLD_WOOD.flammable(5, 5).strippable(GOLD_STRIPPED_WOOD);
    GOLD_PLANKS.flammable(5, 5);
    GOLD_STRIPPED_LOG.flammable(5, 5);
    GOLD_STRIPPED_WOOD.flammable(5, 5);

    GOLD_PLANKS.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_planks"));
    GOLD_SAPLING.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_sapling"));
    GOLD_LOG.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_log"));
    GOLD_STRIPPED_LOG.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_log"));
    GOLD_WOOD.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_wood"));
    GOLD_STRIPPED_WOOD.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_wood"));
    GOLD_LEAVES.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_leaves"));
  }

  /**
   * Sets the render type for all of our blocks.
   * Run this on the client side only.
   */
  public static function registerRenderers():Void
  {
    ResourceTreesMod.LOGGER.info("Registering block renderers...");

    // Saplings
    GOLD_SAPLING.setRenderType(RenderType.cutout());

    // Leaves
    GOLD_LEAVES.setRenderType(RenderType.cutoutMipped());
  }
}
