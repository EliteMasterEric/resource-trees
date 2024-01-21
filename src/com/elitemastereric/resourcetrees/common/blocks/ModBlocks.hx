package com.elitemastereric.resourcetrees.common.blocks;

import net.minecraft.client.renderer.RenderType;
import net.minecraft.data.BlockFamilies;
import net.minecraft.data.BlockFamily;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.world.level.block.SaplingBlock;
import net.minecraft.world.level.block.SoundType;
import net.minecraft.world.level.block.state.BlockBehaviour.Properties as BlockProperties;
import net.minecraft.world.level.block.state.properties.BlockSetType;
import net.minecraft.world.level.material.PushReaction;

import net.pickhaxe.compat.world.level.material.MapColor;
import net.pickhaxe.compat.world.level.block.Block;

import com.elitemastereric.resourcetrees.ResourceTreesMod;
#if minecraft_gteq_1_20_4
import com.elitemastereric.resourcetrees.common.worldgen.grower.ModTreeGrowers;
#else
import com.elitemastereric.resourcetrees.common.worldgen.grower.GoldTreeGrower;
#end

import net.fabricmc.fabric.api.object.builder.v1.block.type.BlockSetTypeBuilder;

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
   * BLOCK SET TYPES
   */
  // ===============
  public static final BLOCKSETTYPE_GOLD:BlockSetType = BlockSetTypeBuilder.copyOf(BlockSetType.OAK).register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold"));

  /**
   * BLOCKS
   */
  // ===============
  
  // Gold
  public static final GOLD_BUTTON:Block = Blocks.woodenButton(BLOCKSETTYPE_GOLD);
  public static final GOLD_LEAVES:Block = Blocks.leaves(SoundType.GRASS);
  public static final GOLD_LOG:Block = Blocks.log(WOOD, PODZOL);
  public static final GOLD_PLANKS:Block = new Block(PROPERTIES_PLANKS);
  public static final GOLD_SAPLING:Block = new SaplingBlock(
    #if minecraft_gteq_1_20_4 ModTreeGrowers.GOLD_WILLOW, #else new GoldTreeGrower(), #end
    PROPERTIES_SAPLING); // :SaplingBlock
  public static final GOLD_STRIPPED_LOG:Block = Blocks.log(WOOD, PODZOL);
  public static final GOLD_STRIPPED_WOOD:Block = Blocks.log(WOOD, PODZOL);
  public static final GOLD_WOOD:Block = Blocks.log(WOOD, PODZOL);

  // NOTE: Field order MATTERS! Register the potted saplings AFTER the saplings or else they won't be able to find the sapling block.
  public static final GOLD_POTTED_SAPLING:Block = Blocks.flowerPot(GOLD_SAPLING); // :FlowerPotBlock

  /**
   * BLOCK FAMILIES
   */
  public static final FAMILY_GOLD_PLANKS:BlockFamily = BlockFamilies.familyBuilder(GOLD_PLANKS)
   .button(GOLD_BUTTON)
   // TODO: Implement slabs etc.
   // .fence(Blocks.OAK_FENCE)
   // .fenceGate(Blocks.OAK_FENCE_GATE)
   // .pressurePlate(Blocks.OAK_PRESSURE_PLATE)
   // .sign(Blocks.OAK_SIGN, Blocks.OAK_WALL_SIGN)
   // .slab(Blocks.OAK_SLAB)
   // .stairs(Blocks.OAK_STAIRS)
   // .door(Blocks.OAK_DOOR)
   // .trapdoor(Blocks.OAK_TRAPDOOR)
   // BOATS???
   .recipeGroupPrefix("wooden").recipeUnlockedBy("has_planks").getFamily();

  /**
   * Adds all of our blocks to the blocks registry.
   */
  public static function register():Void
  {
    ResourceTreesMod.LOGGER.info("Registering blocks...");

    GOLD_BUTTON
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_button"));
    GOLD_LEAVES.flammable(30, 60)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_leaves"));
    GOLD_LOG.flammable(5, 5).strippable(GOLD_STRIPPED_LOG)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_log"));
    GOLD_PLANKS.flammable(5, 5)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_planks"));
    GOLD_POTTED_SAPLING
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_potted_sapling"));
    GOLD_SAPLING
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_sapling"));
    GOLD_STRIPPED_LOG.flammable(5, 5)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_log"));
    GOLD_STRIPPED_WOOD.flammable(5, 5)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_wood"));
    GOLD_WOOD.flammable(5, 5).strippable(GOLD_STRIPPED_WOOD)
      .register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_wood"));
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
    GOLD_POTTED_SAPLING.setRenderType(RenderType.cutout());

    // Leaves
    GOLD_LEAVES.setRenderType(RenderType.cutoutMipped());
  }
}
