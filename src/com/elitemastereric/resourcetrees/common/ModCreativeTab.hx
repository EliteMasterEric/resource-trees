package com.elitemastereric.resourcetrees.common;

import net.minecraft.resources.ResourceLocation;
import net.minecraft.world.item.ItemStack;

import net.pickhaxe.compat.world.item.CreativeModeTab;

import com.elitemastereric.resourcetrees.ResourceTreesMod;
import com.elitemastereric.resourcetrees.common.items.ModItems;

class ModCreativeTab {
	public static final CREATIVE_TAB:CreativeModeTab = CreativeModeTab.builder().displayItems(function(params, entries) {
		entries.accept(ModItems.GOLD_BUTTON);
		entries.accept(ModItems.GOLD_LEAVES);
		entries.accept(ModItems.GOLD_LOG);
		entries.accept(ModItems.GOLD_PLANKS);
		entries.accept(ModItems.GOLD_SAPLING);
		entries.accept(ModItems.GOLD_STRIPPED_LOG);
		entries.accept(ModItems.GOLD_STRIPPED_WOOD);
		entries.accept(ModItems.GOLD_WOOD);
	}).icon(getTabIcon).build();

	public static function registerCreativeTab():Void {
		ResourceTreesMod.LOGGER.info("Registering Creative Mode tab...");

		CREATIVE_TAB.register(new ResourceLocation(ResourceTreesMod.MOD_ID, "resource_trees"));
	}

	static function getTabIcon():ItemStack {
		return new ItemStack(ModItems.GOLD_SAPLING);
	}
}
