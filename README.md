# Overview
This project provides listview implementation - divided in sections. The header of top section is sticky at the top of the list. It is similar to sectioned list from iOS. You Should checkout the project from mercurial repository and use it as external android library project. You need to understand how library projects are used - it is described in android's documentation here: http://developer.android.com/guide/developing/projects/projects-eclipse.html. 
For usage see below.

# Usage
Example activity using the list is part of the project here: https://github.com/Polidea/android-section-list/blob/master/src/pl/polidea/sectionedlist/SectionListActivity.java

Make sure to specify SectionListViewTheme (or an equivalent) as theme in your activity in manifest (see issue#2).

## SectionListView
In order to use SectionListView,  you can either add the SectionListView object in 
the code or add it in the .xml layout similar to [https://github.com/Polidea/android-section-list/blob/master/res/layout/main.xml Layout Example]. SectionListView only accepts SectionListAdapter or class derived from it. Be careful - your SectionListView HAVE TO be inside FrameLayout - with (fill_parent, fill_parent) layout parameters.

## SectionListAdapter
The adapter wraps around any other adapter that provides content. 
The wrapped adapter should return items of the SectionListItem type. 
You should extend from this class and write your own implementation of setSectionText and getSectionView  
in case you want to provide your own view for section header. 
Each SectionListItem contains section name, all items with the same section name should be placed next 
to each other, otherwise there will be two different sections created.

## OnItemClickListener
The SectionListAdapter supports also wrapped OnItemClickListener. 
It is enough to register your original onItemClickListener with setOnItemClickListener and 
then register the adapter as listener in SectionListView. T
hat's all - adapter will recalculate the position so that your original 
listener's methods are called with the right item position.
