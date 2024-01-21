package com.elitemastereric.resourcetrees.common.items;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.Item.Item_Properties;

import net.pickhaxe.compat.world.item.BlockItem;
import net.pickhaxe.compat.world.item.Item;

import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.ResourceTreesMod;
import com.elitemastereric.resourcetrees.ResourceTreesMod;

/**
 * Holds references to all of our items,
 * and handles adding them to the item registry.
 */
class ModItems
{
  /**
   * BLOCKS
   */
  // ===============

  // Gold
  public static final GOLD_BUTTON:BlockItem = new BlockItem(ModBlocks.GOLD_BUTTON, new Item_Properties());
  public static final GOLD_LEAVES:BlockItem = new BlockItem(ModBlocks.GOLD_LEAVES, new Item_Properties());
  public static final GOLD_LOG:BlockItem = new BlockItem(ModBlocks.GOLD_LOG, new Item_Properties());
  public static final GOLD_PLANKS:BlockItem = new BlockItem(ModBlocks.GOLD_PLANKS, new Item_Properties());
  public static final GOLD_SAPLING:BlockItem = new BlockItem(ModBlocks.GOLD_SAPLING, new Item_Properties());
  public static final GOLD_STRIPPED_LOG:BlockItem = new BlockItem(ModBlocks.GOLD_STRIPPED_LOG, new Item_Properties());
  public static final GOLD_STRIPPED_WOOD:BlockItem = new BlockItem(ModBlocks.GOLD_STRIPPED_WOOD, new Item_Properties());
  public static final GOLD_WOOD:BlockItem = new BlockItem(ModBlocks.GOLD_WOOD, new Item_Properties());

  // Boats

  public static function register():Void
  {
    ResourceTreesMod.LOGGER.info("Registering items...");

    // Gold
    GOLD_BUTTON.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_button"));
    GOLD_LEAVES.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_leaves"));
    GOLD_LOG.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_log"));
    GOLD_PLANKS.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_planks"));
    GOLD_SAPLING.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_sapling"));
    GOLD_STRIPPED_LOG.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_log"));
    GOLD_STRIPPED_WOOD.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "stripped_gold_wood"));
    GOLD_WOOD.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "gold_wood"));
  }
}
