package pl.polidea.SectionList;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ArrayAdapter;

public class SectionListActivity extends Activity {

    SectionListItem exampleArray[] = { // Comment to prevent re-format
    new SectionListItem("Test 1 - A", "A"), //
            new SectionListItem("Test 2 - A", "A"), //
            new SectionListItem("Test 3 - A", "A"), //
            new SectionListItem("Test 4 - A", "A"), //
            new SectionListItem("Test 5 - A", "A"), //
            new SectionListItem("Test 6 - B", "B"), //
            new SectionListItem("Test 7 - B", "B"), //
            new SectionListItem("Test 8 - B", "B"), //
            new SectionListItem("Test 9 - Long", "Long section"), //
            new SectionListItem("Test 10 - Long", "Long section"), //
            new SectionListItem("Test 11 - Long", "Long section"), //
            new SectionListItem("Test 12 - Long", "Long section"), //
            new SectionListItem("Test 13 - Long", "Long section"), //
            new SectionListItem("Test 14 - A again", "A"), //
            new SectionListItem("Test 15 - A again", "A"), //
            new SectionListItem("Test 16 - A again", "A"), //
            new SectionListItem("Test 17 - B again", "B"), //
            new SectionListItem("Test 18 - C", "C"), //
    };

    private ArrayAdapter<SectionListItem> arrayAdapter;

    @Override
    public void onCreate(final Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        arrayAdapter = new ArrayAdapter<SectionListItem>(this, R.layout.example_list_view, R.id.example_text_view,
                exampleArray);
        final SectionListView listView = (SectionListView) findViewById(R.id.section_list_view);
        listView.setAdapter(arrayAdapter);
    }
}