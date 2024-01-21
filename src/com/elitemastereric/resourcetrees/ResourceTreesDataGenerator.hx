package com.elitemastereric.resourcetrees;

import net.minecraft.world.level.block.FlowerPotBlock;
import java.nio.file.Path;
import java.util.function.Consumer;
import net.minecraft.advancements.Advancement;
import net.minecraft.advancements.AdvancementHolder;
import net.minecraft.advancements.AdvancementType;
import net.minecraft.data.loot.BlockLootSubProvider;
import net.minecraft.data.models.BlockModelGenerators;
import net.minecraft.data.models.BlockModelGenerators.BlockModelGenerators_TintState;
import net.minecraft.data.models.ItemModelGenerators;
import net.minecraft.data.models.model.TexturedModel;
import net.minecraft.data.recipes.RecipeOutput;
import net.minecraft.network.chat.Component;
import net.minecraft.resources.ResourceLocation;
import net.minecraft.tags.BlockTags;
import net.minecraft.data.recipes.packs.VanillaRecipeProvider;
import net.minecraft.data.recipes.RecipeProvider;
import net.minecraft.world.item.ItemStack;
import net.minecraft.world.level.block.Blocks;
import net.minecraft.core.HolderLookup.HolderLookup_Provider;
import net.pickhaxe.java.NativeArrayUtil;
import net.pickhaxe.compat.world.level.block.Block;
import net.pickhaxe.datagen.DataGenerator;
import net.pickhaxe.datagen.DataGenerator.PickHaxeItemTagProvider;
import net.pickhaxe.datagen.DataGenerator.PickHaxeBlockTagProvider;
import com.elitemastereric.resourcetrees.common.blocks.ModBlocks;
import com.elitemastereric.resourcetrees.common.items.ModItems;
import com.elitemastereric.resourcetrees.common.ModTags;
import net.fabricmc.fabric.api.datagen.v1.FabricDataOutput;
import net.fabricmc.fabric.api.datagen.v1.provider.FabricLanguageProvider.FabricLanguageProvider_TranslationBuilder as TranslationBuilder;
import net.fabricmc.fabric.api.datagen.v1.provider.FabricTagProvider.FabricTagProvider_BlockTagProvider as BlockTagProvider;
import net.fabricmc.fabric.api.datagen.v1.provider.FabricTagProvider.FabricTagProvider_ItemTagProvider as ItemTagProvider;

/**
 * Provides an interface through which JSON files for the resources folder can be generated through code.
 * 
 * JSON files go into `generated/build/resources/<loader>/<mcversion>/data` and will be included automatically in the JAR.
 */
class ResourceTreesDataGenerator extends DataGenerator {
	/**
	 * Represents 1/5th of the base odds for a sapling to spawn.
	 */
	public static final RARE_LEAVES_SAPLING_CHANCES:Array<Single> = [
		0.050 / 5, // Base
		0.0625 / 5, // Fortune 1
		0.083333336 / 5, // Fortune 2
		0.100 / 5 // Fortune 3
	];

	public override function onGenerateAdvancements(consumer:Consumer<AdvancementHolder>):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees advancements...");

		var root:AdvancementHolder = Advancement_Builder.advancement()
			.display(new ItemStack(ModItems.GOLD_SAPLING), Component.translatable("advancement.resourcetrees"),
				Component.translatable("advancement.resourcetrees.desc"), new ResourceLocation("textures/gui/advancements/backgrounds/dirt.png"),
				AdvancementType.TASK, false, false, false)
			.save(consumer, '${ResourceTreesMod.MOD_ID}:root');
	}

	public override function onGenerateBlockLootTables(loot:BlockLootSubProvider):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees block loot tables...");

		// Basic drops
		loot.dropSelf(ModBlocks.GOLD_BUTTON);
		loot.dropSelf(ModBlocks.GOLD_LOG);
		loot.dropSelf(ModBlocks.GOLD_PLANKS);
		loot.dropSelf(ModBlocks.GOLD_SAPLING);
		loot.dropSelf(ModBlocks.GOLD_STRIPPED_LOG);
		loot.dropSelf(ModBlocks.GOLD_STRIPPED_WOOD);
		loot.dropSelf(ModBlocks.GOLD_WOOD);

		// Potted saplings
		loot.dropPottedContents(ModBlocks.GOLD_POTTED_SAPLING);

		// Leaves
		makeLeavesDrops(loot, ModBlocks.GOLD_LEAVES, ModBlocks.GOLD_SAPLING, RARE_LEAVES_SAPLING_CHANCES);
	}

	private function makeLeavesDrops(loot:BlockLootSubProvider, leaves:Block, sapling:Block, odds:Array<Single>) {
		loot.add(leaves, (block:Block) -> loot.createLeavesDrops(block, sapling, NativeArrayUtil.fromArray(RARE_LEAVES_SAPLING_CHANCES)));
	}

	public override function onGenerateTranslations(dataOutput:FabricDataOutput, languageCode:String, translationBuilder:TranslationBuilder):Void {
		switch (languageCode) {
			case "en_us":
				onGenerateTranslations_en_us(dataOutput, translationBuilder);
		}
	}

	private function addBaseTranslations(dataOutput:FabricDataOutput, languageCode:String, translationBuilder:TranslationBuilder):Void {
		try {
			translationBuilder.add(getBaseTranslationPath(dataOutput, languageCode));
		} catch (e) {
			ResourceTreesMod.LOGGER.error("Failed to load base translation file for '${languageCode}'.", e);
		}
	}

	private function getBaseTranslationPath(dataOutput:FabricDataOutput, languageCode:String):Path {
		return dataOutput.getModContainer().findPath('assets/${ResourceTreesMod.MOD_ID}/lang/${languageCode}.base.json').get();
	}

	private function onGenerateTranslations_en_us(dataOutput:FabricDataOutput, translationBuilder:TranslationBuilder):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees 'en_us' translations...");

		// Hardcoded translations.
		addBaseTranslations(dataOutput, 'en_us', translationBuilder);

		// Tree names used in multiple translations.
		var treeNames:Map<String, String> = [
			"copper" => "Copper Tree",
			"diamond" => "Diamond Pine",
			"emerald" => "Emerald Aspen",
			"gold" => "Gold Willow",
			"iron" => "Iron Tree",
			"lapis" => "Lapis Tree",
			"redstone" => "Redstone Larch",
		];

		// Block names.
		for (treePair in treeNames.keyValueIterator()) {
			var treeId:String = treePair.key;
			var treeName:String = treePair.value;

			translationBuilder.add('block.resourcetrees.${treeId}_leaves', '${treeName} Leaves');
			translationBuilder.add('block.resourcetrees.${treeId}_log', '${treeName} Log');
			translationBuilder.add('block.resourcetrees.${treeId}_planks', '${treeName} Planks');
			translationBuilder.add('block.resourcetrees.${treeId}_sapling', '${treeName} Sapling');
			translationBuilder.add('block.resourcetrees.${treeId}_stripped_log', 'Stripped ${treeName} Log');
			translationBuilder.add('block.resourcetrees.${treeId}_stripped_planks', 'Stripped ${treeName} Planks');
			translationBuilder.add('block.resourcetrees.${treeId}_wood', '${treeName} Wood');
		}
	}

	public override function onGenerateBlockStateModels(blockModelGenerators:BlockModelGenerators):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees block models...");

		// Standard cube model, same texture for all sides
		blockModelGenerators.createTrivialBlock(ModBlocks.GOLD_LEAVES, TexturedModel.LEAVES);

		// Cross model. 2 instances of the same texture in an X shape.
		// Sets up both the standard and potted variants.
		blockModelGenerators.createPlant(ModBlocks.GOLD_SAPLING, ModBlocks.GOLD_POTTED_SAPLING, BlockModelGenerators_TintState.NOT_TINTED);

		// Logs, wood, stripped logs, and stripped wood.
		blockModelGenerators.woodProvider(ModBlocks.GOLD_LOG).logWithHorizontal(ModBlocks.GOLD_LOG).wood(ModBlocks.GOLD_WOOD);
		blockModelGenerators.woodProvider(ModBlocks.GOLD_STRIPPED_LOG).logWithHorizontal(ModBlocks.GOLD_STRIPPED_LOG).wood(ModBlocks.GOLD_STRIPPED_WOOD);

		// Generate an entire family of block models based on the base wood plank block.
		blockModelGenerators.family(ModBlocks.GOLD_PLANKS).generateFor(ModBlocks.FAMILY_GOLD_PLANKS);
	}

	public override function onGenerateItemModels(itemModelGenerators:ItemModelGenerators):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees item models...");

		// Block item models are automatically generated for all blocks created in onGenerateBlockStateModels.
	}

	public override function onGenerateRecipes(recipeOutput:RecipeOutput):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees recipes...");

		// Logs into planks
		RecipeProvider.planksFromLogs(recipeOutput, ModBlocks.GOLD_PLANKS, ModTags.ITEM_GOLD_LOGS, 4);
		// Logs into wood
		RecipeProvider.woodFromLogs(recipeOutput, ModBlocks.GOLD_WOOD, ModBlocks.GOLD_LOG);
		RecipeProvider.woodFromLogs(recipeOutput, ModBlocks.GOLD_STRIPPED_WOOD, ModBlocks.GOLD_STRIPPED_LOG);

		// Other items
		// VanillaRecipeProvider.woodenBoat(recipeOutput, Items.SPRUCE_BOAT, Blocks.SPRUCE_PLANKS);
		// VanillaRecipeProvider.chestBoat(recipeOutput, Items.SPRUCE_CHEST_BOAT, Items.SPRUCE_BOAT);
		// VanillaRecipeProvider.hangingSign(recipeOutput, Items.SPRUCE_HANGING_SIGN, Blocks.STRIPPED_SPRUCE_LOG);
	}

	public override function onGenerateItemTags(itemTagProvider:PickHaxeItemTagProvider, provider:HolderLookup_Provider):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees item tags...");

		// Create a FabricTagBuilder<Item> when given an item tag.
		itemTagProvider.getTagBuilder(ModTags.ITEM_GOLD_LOGS)
			.add(ModItems.GOLD_LOG)
			.add(ModItems.GOLD_WOOD)
			.add(ModItems.GOLD_STRIPPED_LOG)
			.add(ModItems.GOLD_STRIPPED_WOOD);
	}

	public override function onGenerateBlockTags(blockTagProvider:PickHaxeBlockTagProvider, provider:HolderLookup_Provider):Void {
		ResourceTreesMod.LOGGER.info("Generating ResourceTrees block tags...");

		// Create a FabricTagBuilder<Block> when given a block tag.
		blockTagProvider.getTagBuilder(ModTags.BLOCK_GOLD_LOGS)
			.add(ModBlocks.GOLD_LOG)
			.add(ModBlocks.GOLD_WOOD)
			.add(ModBlocks.GOLD_STRIPPED_LOG)
			.add(ModBlocks.GOLD_STRIPPED_WOOD);

		blockTagProvider.getTagBuilder(BlockTags.FLOWER_POTS)
			.add(ModBlocks.GOLD_POTTED_SAPLING);

		// Add to the vanilla tag for wooden buttons.
		blockTagProvider.getTagBuilder(BlockTags.WOODEN_BUTTONS).add(ModBlocks.GOLD_BUTTON);
	}
}
